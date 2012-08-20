<!--- $issue$: consolidate with common_files/, Customers/, and Timekeeping/qry_get_open_tasks --->
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
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
			AND  Team.role_id=3
	INNER JOIN Emp_Contact ON Team.emp_id=Emp_Contact.emp_id
	INNER JOIN Project ON Task.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
		AND Link_Project_Company.company_id IN (#session.workstream_company_id#)
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
	INNER JOIN (
		SELECT Path.task_id, COALESCE(Recorded_Hours.hours_used,0) AS time_used, Path.path AS task_icon, 
			(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0 ELSE (Recorded_Hours.hours_used/Task.budgeted_hours) END,0)*100) AS percent_time_used,
			REF_Status.status AS task_status, Emp_Contact.lname AS task_owner
		FROM Task
			INNER JOIN REF_Status ON Task.status_id=REF_Status.status_id
			INNER JOIN Team ON Task.task_id=Team.task_id
				AND Team.role_id=1
			INNER JOIN Emp_Contact ON Emp_Contact.emp_id=Team.emp_id
			INNER JOIN (
				SELECT Valid_Tasks.task_id, CASE WHEN REF_Icon.path='0' THEN 'document.gif' ELSE REF_Icon.path END as path
				FROM Task
					INNER JOIN REF_Icon ON Task.icon_id=REF_Icon.icon_id
					INNER JOIN (
						SELECT Task.task_id
						FROM Task
						WHERE Task.project_id=#attributes.project_id#
							AND Task.status_id!=7 /*exclude closed tasks*/
					)  AS Valid_Tasks ON Task.task_id=Valid_Tasks.task_id
			) AS Path ON Task.task_id=Path.task_id
			LEFT OUTER JOIN (
				SELECT task_id, SUM(hours) AS hours_used
				FROM Time_Entry
				WHERE active_ind=1
				GROUP BY task_id
			) AS Recorded_Hours ON Path.task_id=Recorded_Hours.task_id
	) AS Task_Details ON Task.task_id=Task_Details.task_id
WHERE Project.project_id=#attributes.project_id#<cfif isdefined("session.workstream_task_list_order")>
ORDER BY #session.workstream_task_list_order#</cfif>
</cfquery>
