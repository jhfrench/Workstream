<!--- $issue$: is this template used? --->
<!--Customers/qry_get_open_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfparam name="attributes.project_id" default="0">
<cfquery name="get_open_tasks" datasource="#application.datasources.main#">
SELECT 1 AS constant, Task.due_date AS date_due, Task.task_id, 
	Task.name AS task_name, COALESCE(Task.description, 'No description provided.') AS task_description, REF_Priority.description AS priority,
	COALESCE(Task.budgeted_hours,0) AS time_budgeted, Task.status_id, 
	Task_Details.time_used, Task_Details.task_icon, 
	Task_Details.percent_time_used, Task_Details.task_owner,
	(CASE WHEN Task.status_id=3 /* QA */ THEN Task_Details.task_status || ' by ' || Emp_Contact.lname ELSE Task_Details.task_status END) AS task_status,
	(Customer.description || '-' || Project.description) AS project_name, Project.project_code AS project_code
FROM Task, Team, Emp_Contact,  Customer, Project, Link_Project_Company, REF_Priority,
	(SELECT Path.task_id, COALESCE(Recorded_Hours.hours_used,0) AS time_used, Path.path AS task_icon, 
		(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0 ELSE (Recorded_Hours.hours_used/Task.budgeted_hours) END,0)*100) AS percent_time_used,
		REF_Status.status AS task_status, Emp_Contact.lname AS task_owner
	FROM Task, REF_Status, Team, Emp_Contact,
		(SELECT Valid_Tasks.task_id, CASE WHEN REF_Icon.path='0' THEN 'document.gif' ELSE REF_Icon.path END as path
			FROM
			(SELECT Task.task_id
			FROM Task
			WHERE Task.project_id=#attributes.project_id#
				AND Task.status_id!=7 /*exclude closed tasks*/) 
		AS Valid_Tasks, Task, REF_Icon
		WHERE Valid_Tasks.task_id=Task.task_id AND REF_Icon.icon_id=Task.icon_id)
	AS Path
	LEFT OUTER JOIN (
		SELECT task_id, SUM(hours) AS hours_used
		FROM Time_Entry
		WHERE active_ind=1
		GROUP BY task_id
	) AS Recorded_Hours ON Path.task_id = Recorded_Hours.task_id
	WHERE Task.task_id=Path.task_id
		AND REF_Status.status_id=Task.status_id 
		AND Team.role_id=1 AND Task.task_id=Team.task_id 
		AND Emp_Contact.emp_id=Team.emp_id)
AS Task_Details
WHERE Customer.customer_id=Project.customer_id
	AND Task_Details.task_id=Team.task_id
	AND Task.project_id=Project.project_id 
	AND Task.task_id=Task_Details.task_id
	AND Emp_Contact.emp_id=Team.emp_id 
	AND Link_Project_Company.project_id=Project.project_id
	AND Task.priority_id=REF_Priority.priority_id
	AND Link_Project_Company.company_id IN (#session.workstream_company_id#)
	AND Team.role_id=3
	AND Project.project_id=#attributes.project_id#
	AND project.project_type_id!=3<cfif isdefined("session.workstream_task_list_order")>
ORDER BY #session.workstream_task_list_order#</cfif>
</cfquery>
