
<!--Customers/qry_get_tasks_to_deactivate.cfm
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
<cfquery name="get_tasks_to_deactivate" datasource="#application.datasources.main#">
SELECT Task.description AS task_description, Task.name, Task.project_code,
	Demographics.first_name ||' '|| Demographics.last_name AS task_owner, Task.project_id, Task.task_id
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1
	INNER JOIN Project ON Task.project_id=Project.project_id
	INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Task.complete_date IS NULL
	AND Project.project_id=#attributes.project_id#
</cfquery>
<cfset task_id=valuelist(tasks_to_inactive.task_id)>
</cfsilent>