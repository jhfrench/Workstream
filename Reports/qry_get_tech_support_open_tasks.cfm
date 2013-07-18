
<!--Reports/qry_get_tech_support_open_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves information about currently open tech support tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="get_tech_support_open_tasks" cachedwithin="#attributes.report_cached_within#" datasource="#application.datasources.main#">
SELECT Demographics.last_name, Task.task_id, Task.name,
	Task.due_date,  COALESCE(Task.budgeted_hours,0) AS budgeted_hours, REF_Task_Status.description AS status,
	REF_Priority.description AS priority
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1
	INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
		AND Link_Task_Task_Status.task_status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
	INNER JOIN REF_Task_Status ON Link_Task_Task_Status.task_status_id=REF_Task_Status.task_status_id
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
WHERE Task.active_ind=1
	AND LOWER(Task.name) LIKE 'ts%'
ORDER BY Demographics.last_name
</cfquery>
</cfsilent>