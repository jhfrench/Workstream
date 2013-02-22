
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
<cfset attributes.date_linked=createodbcdate("#attributes.force_month#/28/#attributes.force_year#")>
<cfinclude template="../common_files/qry_get_subordinates.cfm">
<cfset variables.emp_init_loop=valuelist(get_subordinates.initials)>
<cfset variables.target_population=listappend(valuelist(get_subordinates.user_account_id), variables.user_identification)>
</cfsilent>
<cfquery name="get_prospectives" datasource="#application.datasources.main#">
/*top query selects Forceplanner tasks for the selected month*/
SELECT ' checked="checked"' AS previously_assigned, '<cfif NOT datecompare(attributes.date_linked, now())> disabled="disabled"</cfif>' AS disabled_text, 
	CASE 
		WHEN Link_Task_Task_Status.task_status_id IN (9,10) /*on hold, prospective*/ THEN
			CASE 
				WHEN SUM(COALESCE(Time_Entry.hours,0))=0 THEN 1 /*new*/
				ELSE 3 /*in progress*/
			END
		ELSE Link_Task_Task_Status.task_status_id 
	END AS previous_entry, 
	Task.task_id, Customer.description || '-' || Project.description AS project_name, Project.project_id,
	Task.due_date, LEFT(Task.name,65) AS task_name, COALESCE(Task.budgeted_hours,0) AS budget<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">, 
	(CASE WHEN Forecast_Assignment.user_account_id=#variables.user_account_id# THEN COALESCE(Forecast_Assignment.hours_budgeted,0) ELSE 0 END) AS budget#variables.user_account_id#
	</cfloop>,
	REF_Billable_Type.description AS billable_type_description, REF_Billable_Type.sort_order AS billable_type_order,
	REF_Priority.description AS task_priority, REF_Priority.sort_order AS priority_order, 1 AS main_sort
FROM Forecast
	INNER JOIN Forecast_Assignment ON Forecast.forecast_id=Forecast_Assignment.forecast_id
		AND Forecast_Assignment.active_ind=1
	INNER JOIN Task ON Forecast_Assignment.task_id=Task.task_id
		AND Task.active_ind=1
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
		AND REF_Priority.active_ind=1
	INNER JOIN Project ON Task.project_id=Project.project_id
		AND Project.active_ind=1
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
		AND Customer.active_ind=1
	INNER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
		AND REF_Billable_Type.active_ind=1
	INNER JOIN (
		SELECT Team.task_id, Team.user_account_id, MIN(Team.role_id) AS role_id
		FROM Team
		WHERE Team.active_ind=1
			AND Team.user_account_id IN (#variables.target_population#)
			AND Team.role_id IN (1,4)
		GROUP BY Team.task_id, Team.user_account_id
	) AS Team ON Task.task_id=Team.task_id
	LEFT OUTER JOIN Time_Entry ON Task.task_id=Time_Entry.task_id
		AND Time_Entry.active_ind=1
WHERE Forecast.active_ind=1
	AND Forecast.forecast_year=#attributes.force_year#
	AND Forecast.forecast_month=#attributes.force_month#
GROUP BY Forecast_Assignment.task_id, Forecast_Assignment.user_account_id, Forecast_Assignment.hours_budgeted, 
	Task.task_id, project_name, Project.project_id, 
	Task.due_date, Link_Task_Task_Status.task_status_id, task_name, Task.budgeted_hours,
	REF_Billable_Type.description, REF_Billable_Type.sort_order,
	REF_Priority.description, REF_Priority.sort_order
UNION ALL
/*bottom query selects tasks that weren't forceplanned for the selected month*/
SELECT '' AS previously_assigned, '<cfif NOT datecompare(attributes.date_linked, now())> disabled="disabled"</cfif>' AS disabled_text,
	CASE
		WHEN Link_Task_Task_Status.task_status_id IN (9,10) /*on hold, prospective*/ THEN
			CASE 
				WHEN SUM(COALESCE(Time_Entry.hours,0))=0 THEN 1 /*new*/
				ELSE 3 /*in progress*/
			END
		ELSE Link_Task_Task_Status.task_status_id
	END AS previous_entry, 
	Task.task_id, Customer.description || '-' || Project.description AS project_name, Project.project_id, 
	Task.due_date, LEFT(Task.name,65) AS task_name, COALESCE(Task.budgeted_hours,0) AS budget<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">, 
	SUM(CASE WHEN Team.role_id=1 AND Team.user_account_id=#variables.user_account_id# THEN COALESCE(Task.budgeted_hours,0) ELSE 0 END) AS budget#variables.user_account_id#
	</cfloop>,
	REF_Billable_Type.description AS billable_type_description, REF_Billable_Type.sort_order AS billable_type_order,
	REF_Priority.description AS task_priority, REF_Priority.sort_order AS priority_order, 2 AS main_sort
FROM Task
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
		AND REF_Priority.active_ind=1
	INNER JOIN Project ON Task.project_id=Project.project_id
		AND Project.active_ind=1
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
		AND Customer.active_ind=1
	INNER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
		AND REF_Billable_Type.active_ind=1
	INNER JOIN (
		SELECT Team.task_id, Team.user_account_id, MIN(Team.role_id) AS role_id
		FROM Team
		WHERE Team.active_ind=1
			AND Team.user_account_id IN (#variables.target_population#)
			AND Team.role_id IN (1,4)
		GROUP BY Team.task_id, Team.user_account_id
	) AS Team ON Task.task_id=Team.task_id
	LEFT OUTER JOIN (
		SELECT Time_Entry.task_id, SUM(COALESCE(Time_Entry.hours,0)) AS hours
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
		GROUP BY Time_Entry.task_id
	) AS Time_Entry ON Task.task_id=Time_Entry.task_id
WHERE Task.active_ind=1
	AND Task.task_id NOT IN (
			SELECT Forecast_Assignment.task_id
			FROM Forecast
				INNER JOIN Forecast_Assignment ON Forecast.forecast_id=Forecast_Assignment.forecast_id
					AND Forecast_Assignment.active_ind=1
			WHERE Forecast.active_ind=1
				AND Forecast.forecast_year=#attributes.force_year#
				AND Forecast.forecast_month=#attributes.force_month#
			GROUP BY Forecast_Assignment.task_id
		)
	AND <cfif datecompare(attributes.date_linked, now())>Link_Task_Task_Status.task_status_id!=7 /*exclude closed tasks*/
	AND Task.assigned_date < <cfqueryparam cfsqltype="cf_sql_date" value="#attributes.date_linked#" /> /*show tasks assigned (to be started) before the selected month*/<cfelse>EXTRACT(MONTH FROM Task.assigned_date)=#attributes.force_month# AND EXTRACT(YEAR FROM Task.assigned_date)=#attributes.force_year# /*show tasks assigned (to be started) during the selected month*/</cfif>
GROUP BY Task.task_id, project_name, Project.project_id, 
	Link_Task_Task_Status.task_status_id, Task.due_date, task_name,
	Task.budgeted_hours,
	REF_Billable_Type.description, REF_Billable_Type.sort_order,
	REF_Priority.description, REF_Priority.sort_order
ORDER BY billable_type_order, project_name, priority_order,
	due_date, task_name, main_sort
</cfquery>

<!--- $issue$: Add Employee.expected_workload (int) and convert this query to include it in the calculation of capacity --->
<cfquery name="get_week_days" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT COUNT(*) * 8 AS hours_in_month
FROM REF_Date
WHERE date_month=#attributes.force_month#
	AND date_year=#attributes.force_year#
	AND holiday_ind=0
	AND weekend_ind=0
</cfquery>

<cfquery name="get_years" datasource="#application.datasources.main#">
SELECT MAX(EXTRACT(YEAR FROM assigned_date)) AS max_year, MIN(EXTRACT(YEAR FROM assigned_date)) AS min_year
FROM Task
</cfquery>

<cfset variables.colspan=get_subordinates.recordcount+10>