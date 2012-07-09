
<!--common_files/qry_get_task_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_task_details" datasource="#application.datasources.main#">
SELECT Task.name AS task_name, ISNULL(Task.description,'No description recorded for this task.') AS description, 
	Task.project_id, Task.entry_date AS date_assigned, 
	Task.due_date AS due_date, Task.status_id AS status_id, 
	ISNULL(Task.budgeted_hours,0) AS budgeted_hours, Task.icon_id AS icon_id,
	Task.priority_id AS priority, REF_Status.status AS status
FROM Task, REF_Status
WHERE Task.task_id=#attributes.task_id#
	AND Task.status_id=REF_Status.status_id
</cfquery>
</cfsilent>

