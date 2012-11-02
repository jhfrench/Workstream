
<!--Timekeeping/qry_task_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve tasks from the timekeeping database based on the environment and needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource AS mapped in CF administrator
	--> variables.user_identification: id that identifies user to workstream
	--> session.workstream_show_closed: number that indicates the desire of the user to hide or show tasks which have already been completed; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_on_hold: number that indicates the desire of the user to hide or show tasks which have been put on hold; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_team: number that indicates the desire of the user to hide or show tasks for which they are a member of the task team; 1 means include the task, 0 means exclude the task
	--> session.workstream_task_list_order: list of query columns to ORDER BY
	--> [attributes.emp_id]: emp_id of the peson whose inbox the user wants to see
	<-- billing_code: code which task time will be invoiced to
	<-- date_due: date when task is due
	<-- percent_time_used: number showing the amount of time used divided by the amount of time budgeted, shown only if time was budgeted
	<-- project_name: name of project which corresponds to the task
	<-- time_budgeted: amount of time allocated or targeted to complete the task
	<-- task_description: details or description of what is required to complete the task
	<-- task_icon: icon specified for the task
	<-- task_id: unique number that identifies task entry
	<-- task_name: name or title of the task
	<-- task_owner: last name of the person ultimately responsible for succesful task resolution
	<-- task_qa: last name of the person in charge of performing quality analysis on the tasks
	<-- task_status: string that indicates the current status of the task
	<-- time_used: total amount of time recorded towards completion of the task
 --->
<cfif isdefined("attributes.ignore_owner")>
	<cfset variables.from_invoice=1>
	<cfset attributes.month=listfirst(ignore_owner,"|")>
	<cfset attributes.year=listlast(ignore_owner,"|")>
<cfelse>
	<cfset variables.from_invoice=0>
</cfif>
<cfif isdefined("attributes.emp_id") AND listlen(attributes.emp_id,"|") GT 1>
	<cfset attributes.inbox_owner = listlast(attributes.emp_id,"|")>
	<cfset attributes.emp_id=listdeleteat(attributes.emp_id, "2","|")>
</cfif>

<cfif isdefined("attributes.emp_id") AND listlen(attributes.emp_id) GT 1 AND listfind(session.workstream_task_list_order, "task_owner")>
	<cfset variables.temp_task_list_order=listdeleteat(session.workstream_task_list_order, listfind(session.workstream_task_list_order, "task_owner"))>
<cfelse>
	<cfset variables.temp_task_list_order=session.workstream_task_list_order>
</cfif>

<cfquery name="task_list" datasource="#application.datasources.main#">
SELECT 1 AS constant, Task.due_date AS date_due, Task.task_id, 
	Task.name AS task_name, COALESCE(Task.description, 'No description provided.') AS task_description, COALESCE(Task.budgeted_hours,0) AS time_budgeted,
	Task.status_id, Task_Details.time_used, Task_Details.task_icon, 
	Task_Details.percent_time_used, Task_Details.task_owner, Task_Details.task_owner_full,
	(CASE WHEN Task.status_id IN (3,8) /* QA, UAT */ THEN Task_Details.task_status || ' by ' || Emp_Contact.lname ELSE Task_Details.task_status END) AS task_status,
	(Customer.description || '-' || Project.description) AS project_name, priority
FROM Task, Team, Emp_Contact,
	Customer, Project, Link_Project_Company, (
		SELECT Path.task_id, COALESCE(Recorded_Hours.hours_used,0) AS time_used, Path.class_name AS task_icon, 
			(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0)=0 THEN 0 ELSE (Recorded_Hours.hours_used/Task.budgeted_hours) END,0)*100) AS percent_time_used,
			REF_Status.status AS task_status, Emp_Contact.lname AS task_owner, (Emp_Contact.lname || ', ' || Emp_Contact.name) AS task_owner_full,
			priority
		FROM Task, REF_Status, Team,
			Emp_Contact, (
				SELECT Valid_Tasks.task_id, REF_Icon.class_name, priority
				FROM (
					SELECT Task.task_id, REF_Priority.description AS priority
					FROM Task 
						INNER JOIN REF_Priority on Task.priority_id=REF_Priority.priority_id
						INNER JOIN Team ON Task.task_id=Team.task_id
							AND Team.active_ind=1
					WHERE 1=1<cfif NOT variables.from_invoice>
						AND Team.emp_id IN (<cfif isdefined("attributes.emp_id")><cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.emp_id#" /><cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#" list="yes" /></cfif>)
						AND (
							(
								Team.role_id IN (1<cfif session.workstream_show_team>,4</cfif>)
								AND Task.status_id NOT IN (<cfif NOT session.workstream_show_closed>7,</cfif><cfif NOT session.workstream_show_on_hold>9,</cfif>10) /*completed, on hold, prospective*/
							)
							OR (
								Team.role_id=3 /* QA */
								AND Task.status_id=3 /* QA */
							)
						)</cfif>
					GROUP BY Task.task_id, REF_Priority.description
				) AS Valid_Tasks, Task, REF_Icon
				WHERE Valid_Tasks.task_id=Task.task_id
					AND REF_Icon.icon_id=Task.icon_id
			) AS Path
			<cfif variables.from_invoice>INNER<cfelse>LEFT OUTER</cfif> JOIN (
				SELECT task_id, SUM(hours) AS hours_used
				FROM Time_Entry
				WHERE Time_Entry.active_ind=1<cfif variables.from_invoice>
					AND EXTRACT(MONTH FROM Time_Entry.work_date)=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.month#" />
					AND EXTRACT(YEAR FROM Time_Entry.work_date)=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.year#" /></cfif>
				GROUP BY task_id
			) AS Recorded_Hours ON Path.task_id = Recorded_Hours.task_id
		WHERE Task.task_id=Path.task_id
			AND REF_Status.status_id=Task.status_id
			AND Task.task_id=Team.task_id 
			AND Team.active_ind=1
			AND Team.role_id=1
			AND Emp_Contact.emp_id=Team.emp_id
	) AS Task_Details
WHERE Customer.customer_id=Project.customer_id
	AND Task_Details.task_id=Team.task_id
	AND Task.project_id=Project.project_id 
	AND Task.task_id=Task_Details.task_id
	AND Emp_Contact.emp_id=Team.emp_id 
	AND Link_Project_Company.project_id=Project.project_id 
	AND Link_Project_Company.company_id IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#session.workstream_company_id#" list="yes" />)
	AND Team.active_ind=1
	AND Team.role_id=3 /* QA */<cfif isdefined("attributes.project_id")>
	AND Project.project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#" /></cfif>
	AND Project.project_type_id!=3<cfif isdefined("session.workstream_task_list_order")>
ORDER BY <cfif isdefined("attributes.emp_id") AND listlen(attributes.emp_id) GT 1>task_owner, #variables.temp_task_list_order#<cfelse>#session.workstream_task_list_order#</cfif></cfif>
</cfquery>
</cfsilent>
