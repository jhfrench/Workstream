
<!--Timekeeping/qry_express_task_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the list of tasks that a user may need to enter time for from the express entry page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="express_task_list" datasource="#application.datasources.main#">
SELECT *
FROM
	(SELECT Task.name AS task_name, Task.task_id AS workflow_id, 1 AS grouper
	FROM Team, Task, Project 
	WHERE Team.task_id=Task.task_id 
		AND Task.project_id=Project.project_id 
		AND Task.status_id NOT IN (7,11,13)
		AND Team.roll_id=1
		AND team.emp_id=#session.user_account_id#
		AND Project.project_code NOT BETWEEN '6517' AND '6505'
	UNION ALL
	SELECT (Emp_Contact.lname + ' - ' + Task.name) AS task_name, Task.task_id AS workflow_id, 2 AS grouper
	FROM Task, Team, Emp_Contact
	WHERE Team.emp_id=Emp_Contact.emp_id 
		AND Task.task_id=Team.task_id 
		AND Task.status_id NOT IN (7,11,13)
		AND roll_id=1 
		AND team.emp_id != #session.user_account_id# 
		AND EXISTS
			(SELECT *
			FROM Team
			WHERE task_id=task.task_id
				AND roll_id=4 
				AND team.emp_id=#session.user_account_id#)<cfif session.workstream_company_id EQ 9>
	UNION ALL
	/*generic codes like PTO*/
	SELECT Task.name AS task_name, Task.task_id AS workflow_id, 3 AS grouper
	FROM Task
	WHERE Task.status_id NOT IN (7,11,13)
		AND Task.task_id IN (713,714,719)
	UNION ALL
	/*marketing codes*/
	SELECT Task.name AS task_name, Task.task_id AS workflow_id, 4 AS grouper
	FROM Task
	WHERE (task_id BETWEEN 4648 AND 4706)
		AND Task.status_id NOT IN (7,11,13)</cfif>) AS Express_Task_List
ORDER BY grouper, Express_Task_List.task_name
</cfquery>
</cfsilent>

