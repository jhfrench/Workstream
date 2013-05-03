
<!--common_files/qry_get_associated_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the name, id, due date and status of any asks associated with the task being displayed.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	<-- due_date: date that the task is due
	<-- status: string indicating the progress of the task
	<-- task_id: number that uniquely identifies a task
	<-- task_name: string that gives the name of the task
	END FUSEDOC --->
</cfsilent>
<!--- $issue$:maybe this should be rewritten --->
<cfquery name="get_associated_tasks" datasource="#application.datasources.main#">
SELECT Linked_Tasks.l_t_t_id, Linked_Tasks.task_id, Task.name,
	Task.due_date, REF_Task_Status.description AS status, Linked_Tasks.task_icon,
	Linked_Tasks.sort_order
FROM (
		SELECT Link_Task_Task.l_t_t_id, Link_Task_Task.base_task_id AS task_id, 'task_base' AS task_icon,
			1 AS sort_order
		FROM Link_Task_Task
		WHERE Link_Task_Task.active_ind=1
			AND Link_Task_Task.linked_task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.task_id#">
		UNION ALL
		SELECT Link_Task_Task.l_t_t_id, Link_Task_Task.linked_task_id AS task_id, 'task_sub' AS task_icon,
			2 AS sort_order
		FROM Link_Task_Task
		WHERE Link_Task_Task.active_ind=1
			AND Link_Task_Task.base_task_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.task_id#">
	) AS Linked_Tasks
	INNER JOIN Task ON Linked_Tasks.task_id=Task.task_id
		AND Task.active_ind=1
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
	INNER JOIN REF_Task_Status ON Link_Task_Task_Status.task_status_id=REF_Task_Status.task_status_id
ORDER BY Linked_Tasks.sort_order, Linked_Tasks.task_id
</cfquery>