
<!--Tools/act_forceplanner_queries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French (jeromy_french@hotmail.com)
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.temp_date="#attributes.force_month#/01/attributes.force_year">
<cfset variables.eval_date="08/01/2001">
<cfset attributes.date_linked="#attributes.force_month#/01/#attributes.force_year#">
<cfinclude template="../common_files/qry_get_subordinates.cfm">
<cfset variables.emp_init_loop=valuelist(get_subordinates.initials)>
<cfquery name="get_prospectives" datasource="#application.datasources.main#">
SELECT Cross_Tab.previously_assigned, Cross_Tab.previous_entry, Cross_Tab.task_id, 
	LEFT(Cross_Tab.project,50) AS project, Cross_Tab.project_id, Cross_Tab.due_date,
	LEFT(Cross_Tab.task_name,65) AS task_name, 
<cfloop list="#emp_id_loop#" index="ii"> SUM(Cross_Tab.budget#ii#) AS budget#ii#,</cfloop>
 Cross_Tab.billable, Cross_Tab.budget
FROM
	(/*top query selects Forceplanner tasks for the selected month*/
	SELECT ' checked' AS previously_assigned, 
		CASE 
			WHEN Task.status_id IN (7,13) THEN 
				CASE 
					WHEN SUM(COALESCE(Time_Entry.hours,0)) = 0 THEN 1 
					ELSE 3
				END
			ELSE Task.status_id 
		END AS previous_entry, 
		Task.task_id AS task_id, Customer.description || '-' || Project.description AS project, Project.project_id,
		Task.due_date, Task.name AS task_name, COALESCE(Task.budgeted_hours,0) AS budget, 
		<cfloop list="#emp_id_loop#" index="ii"> (CASE WHEN Forecast_Assignment.emp_id=#ii# THEN COALESCE(Forecast_Assignment.hours_budgeted,0) ELSE 0 END) AS budget#ii#,
		</cfloop>(CASE WHEN Project.billable_type_id = 2 THEN 'NB' ELSE 'B' END) AS billable
	FROM Customer, Project, Task, Team, Time_Entry, Forecast, Forecast_Assignment
	WHERE Customer.customer_id=Project.customer_id
		AND Project.project_id=Task.project_id
		AND Task.task_id=Team.task_id
		AND Task.task_id*=Time_Entry.task_id
		AND Time_Entry.active_ind=1
		AND Task.task_id = Forecast_Assignment.task_id
		AND Forecast.forecast_id=Forecast_Assignment.forecast_id
		AND Forecast.active_ind=1
		AND Forecast_Assignment.active_ind=1
		AND Forecast.forecast_year=#attributes.force_year#
		AND Forecast.forecast_month=#attributes.force_month#
		AND Team.emp_id IN (#session.user_account_id#<cfif get_subordinates.recordcount>,</cfif>#valuelist(get_subordinates.emp_id)#)
		AND Team.role_id IN (1,4)
	GROUP BY Forecast_Assignment.task_id, Forecast_Assignment.emp_id, Forecast_Assignment.hours_budgeted, 
		Task.task_id, Customer.description || '-' || Project.description, Project.project_id, 
		Project.billable_type_id, Task.due_date, Task.status_id, 
		Task.name, Task.budgeted_hours
	UNION ALL
	/*bottom query selects tasks that weren't forceplanned for the selected month*/
	SELECT '<cfif variables.temp_date LT variables.eval_date> disabled="disabled"</cfif>' AS previously_assigned,
		CASE
			WHEN Task.status_id IN (7,13) THEN 
				CASE 
					WHEN SUM(COALESCE(Time_Entry.hours,0)) = 0 THEN 1 
					ELSE 3 
				END
			ELSE Task.status_id
		END AS previous_entry, 
		Task.task_id AS task_id, Customer.description || '-' || Project.description AS project, Project.project_id, 
		Task.due_date, Task.name AS task_name, COALESCE(Task.budgeted_hours,0) AS budget, 
		<cfloop list="#emp_id_loop#" index="ii">SUM(CASE WHEN Team.role_id = 1 AND Team.emp_id =#ii# AND Team.task_id=Task.task_id THEN COALESCE(Task.budgeted_hours,0) ELSE 0 END) AS budget#ii#,
		</cfloop>(CASE WHEN Project.billable_type_id = 2 THEN 'NB' ELSE 'B' END) AS billable
	FROM Customer, Project, Task, Team, Time_Entry
	WHERE Customer.customer_id=Project.customer_id
		AND Project.project_id=Task.project_id
		AND Task.task_id=Team.task_id
		AND Task.task_id*=Time_Entry.task_id
		AND Time_Entry.active_ind=1
		AND <cfif attributes.force_month GTE month(now()) AND attributes.force_year GTE year(now())>Task.status_id != 11 /*exclude closed tasks*/
		AND Task.assigned_date < #createodbcdate(dateadd("m",1,"#attributes.force_month#/01/#attributes.force_year#"))# /*show tasks assigned (to be started) before the selected month*/<cfelse>EXTRACT(MONTH FROM Task.assigned_date)=#attributes.force_month# AND EXTRACT(YEAR FROM Task.assigned_date)=#attributes.force_year# /*show tasks assigned (to be started) during the selected month*/</cfif>
		AND Team.emp_id IN (#session.user_account_id#<cfif get_subordinates.recordcount>,</cfif>#valuelist(get_subordinates.emp_id)#)
		AND Team.role_id IN (1,4)
		AND Task.task_id NOT IN (
			SELECT Forecast_Assignment.task_id
			FROM Forecast
				INNER JOIN Forecast_Assignment ON Forecast.forecast_id=Forecast_Assignment.forecast_id
			WHERE Forecast.active_ind=1
				AND Forecast_Assignment.active_ind=1
				AND Forecast.forecast_year=#attributes.force_year#
				AND Forecast.forecast_month=#attributes.force_month#
		)
	GROUP BY Task.task_id, Customer.description || '-' || Project.description, Project.project_id, 
		Project.billable_type_id, Task.status_id, Task.due_date, 
		Task.name, Task.budgeted_hours)
AS Cross_Tab
GROUP BY Cross_Tab.previously_assigned, Cross_Tab.previous_entry, Cross_Tab.task_id, 
	Cross_Tab.project, Cross_Tab.project_id, Cross_Tab.due_date, 
	Cross_Tab.task_name, Cross_Tab.budget, Cross_Tab.billable
ORDER BY Cross_Tab.billable, LEFT(Cross_Tab.project,50), Cross_Tab.due_date, LEFT(Cross_Tab.task_name,65), Cross_Tab.previously_assigned DESC
</cfquery>

<cfquery name="get_week_days" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT COUNT(*) * 8 AS hours_in_month
FROM REF_Date
WHERE date_month = #attributes.force_month#
	AND date_year = #attributes.force_year#
	AND holiday_ind=0
	AND weekend_ind=0
</cfquery>

<cfquery name="get_years" datasource="#application.datasources.main#">
SELECT MAX(EXTRACT(YEAR FROM assigned_date)) AS max_year, MIN(EXTRACT(YEAR FROM assigned_date)) AS min_year
FROM Task
</cfquery>

<cfset variables.colspan=get_subordinates.recordcount+10>
</cfsilent>

