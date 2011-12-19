
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
<cfquery name="get_associated_tasks" datasource="#application.datasources.main#">
SELECT Task_Link.task_link_id, Task.task_id, Task.name,
	Task.due_date, REF_Status.Status, 'base_task.gif' AS task_icon,
	2 AS description
FROM REF_Status, Task, Task_Link
WHERE REF_Status.Status_ID=Task.status_id
	AND Task.task_id=Task_Link.base_task_id
	AND Task_Link.linked_task_id=#attributes.task_id#
UNION ALL
SELECT Task_Link.task_link_id, Task.task_id, Task.name, Task.due_date, REF_Status.Status, 'sub_task.gif' AS task_icon, 1 AS description
FROM REF_Status, Task, Task_Link
WHERE REF_Status.Status_ID=Task.status_id
	AND Task.task_id=Task_Link.linked_task_id
	AND Task_Link.base_task_id=#attributes.task_id#
ORDER BY description DESC, task_id
</cfquery>

