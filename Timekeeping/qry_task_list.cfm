
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
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> session.user_account_id: id that identifies user to workstream
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
	<cfset from_invoice=1>
	<cfset attributes.month=listfirst(ignore_owner,"|")>
	<cfset attributes.year=listlast(ignore_owner,"|")>
<cfelse>
	<cfset from_invoice=0>
</cfif>
<cfif isdefined("attributes.emp_id") AND listlen(attributes.emp_id,"|") GT 1>
	<cfset attributes.Inbox_owner = listlast(attributes.emp_id,"|")>
	<cfset attributes.emp_id = listDeleteAt(attributes.emp_id, "2","|")>
</cfif>

<cfif isdefined("attributes.emp_id") AND listlen(attributes.emp_id) GT 1 AND ListFind(session.workstream_task_list_order, "task_owner")>
	<cfset variables.temp_task_list_order=ListDeleteAt(session.workstream_task_list_order, ListFind(session.workstream_task_list_order, "task_owner"))>
<cfelse>
	<cfset variables.temp_task_list_order=session.workstream_task_list_order>
</cfif>

<cfquery name="task_list" datasource="#application.datasources.main#">
SELECT 1 as constant, Task.due_date AS date_due, Task.task_id AS task_id, 
	Task.name AS task_name, ISNULL(Task.description, 'No description provided.') AS task_description,
	ISNULL(Task.budgeted_hours,0) AS time_budgeted, Task.status_id AS status_id, 
	Task_Details.time_used AS time_used, Task_Details.task_icon AS task_icon, 
	Task_Details.percent_time_used AS percent_time_used, Task_Details.task_owner AS task_owner,
	(CASE WHEN Task.status_id IN (4,10) THEN Task_Details.task_status+' by '+Emp_Contact.lname ELSE Task_Details.task_status END) AS task_status,
	(Customers.description + '-' + Project.description) AS project_name, priority
FROM Task, Team, Emp_Contact,  Customers, Project, Project_Visible_To, 
	(SELECT Path.task_id AS task_id, ISNULL(Recorded_Hours.hours_used,0) AS time_used, Path.path AS task_icon, 
		(ISNULL(CASE WHEN ISNULL(Task.budgeted_hours,0) = 0 THEN 0 ELSE (Recorded_Hours.hours_used/Task.budgeted_hours) END,0)*100) AS percent_time_used,
		REF_Status.status as task_status, Emp_Contact.lname as task_owner, priority
	FROM Task, REF_Status, Team, Emp_Contact,
		(SELECT Valid_Tasks.task_id AS task_id, CASE WHEN REF_Icon.path='0' THEN 'document.gif' ELSE REF_Icon.path END as path, priority
			FROM
			(SELECT Task.task_id, REF_p.description as priority
			FROM Task Inner join REF_priority REF_p on task.priority_id=REF_p.priority_id, Team
			WHERE Task.task_id=Team.task_id <cfif NOT from_invoice>AND Team.emp_id IN (<cfif isdefined("attributes.emp_id")>#attributes.emp_id#<cfelse>#session.user_account_id#</cfif>)
				AND ((Team.roll_id IN (1,<cfif session.workstream_show_team>4,</cfif>0) AND Task.status_id NOT IN (<cfif NOT session.workstream_show_closed>11,</cfif><cfif NOT session.workstream_show_on_hold>7,</cfif>13)) OR (Team.roll_id=3 AND Task.status_id IN (4,10)))</cfif>
			GROUP BY Task.task_id, REF_p.description) 
		AS Valid_Tasks, Task, REF_Icon
		WHERE Valid_Tasks.task_id=Task.task_id AND REF_Icon.icon_id=Task.icon_id)
	AS Path
	<cfif from_invoice>INNER<cfelse>LEFT OUTER</cfif> JOIN
		(SELECT SUM(hours) as hours_used, task_id as task_id
		FROM Time_Entry<cfif from_invoice>
		WHERE DATEPART(m, Time_Entry.date)=#attributes.month#
			AND DATEPART(yyyy, Time_Entry.date)=#attributes.year#</cfif>
		GROUP BY task_id)
	AS Recorded_Hours
	ON Path.task_id = Recorded_Hours.task_id
	WHERE Task.task_id=Path.task_id AND REF_Status.status_id=Task.status_id 
		AND Team.roll_id=1 AND Task.task_id=Team.task_id 
		AND Emp_Contact.emp_id=Team.emp_id)
AS Task_Details
WHERE Customers.customers_id=Project.customers_id
	AND Task_Details.task_id=Team.task_id AND Task.project_id=Project.project_id 
	AND Task.task_id=Task_Details.task_id AND Emp_Contact.emp_id=Team.emp_id 
	AND Project_Visible_To.project_id=Project.project_id 
	AND Project_Visible_To.company_id IN (#session.workstream_company_id#)
	AND Team.roll_id=3<cfif isdefined("attributes.project_id")>
	AND Project.project_id=#attributes.project_id#</cfif>
	AND project.project_type_id!=3
	<cfif isdefined("session.workstream_task_list_order")>ORDER BY <cfif isdefined("attributes.emp_id") AND listlen(attributes.emp_id) GT 1>task_owner,#variables.temp_task_list_order#<cfelse>#session.workstream_task_list_order#</cfif></cfif>
</cfquery>
</cfsilent>

