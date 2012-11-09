
<!--Customers/qry_get_tasks_to_inactive.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<!--- $issue$ is this template used? --->
<cfquery name="tasks_to_inactive" datasource="#application.datasources.main#">
SELECT Task.description AS task_description, Task.name, Task.project_code,
	Emp_Contact.name ||' '|| Emp_Contact.lname AS task_owner, Task.project_id, Task.task_id
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1
	INNER JOIN Project ON Task.project_id=Project.project_id
	INNER JOIN Emp_Contact ON Team.user_account_id=Emp_Contact.emp_id
WHERE Task.complete_date IS NULL
	AND Project.project_id=#attributes.project_id#
</cfquery>
<cfset task_id=valuelist(tasks_to_inactive.task_id)>
</cfsilent>