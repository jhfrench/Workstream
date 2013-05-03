
<!--common_files/qry_insert_link_task_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I make the entries into the Link_Task_Task table to bind tasks together.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> attributes.base_task_id: number that uniquely defines the base task
	--> attributes.linked_task_id: list of tasks to be attached to a particular task
 --->
<cfquery name="insert_link_task_task" datasource="#application.datasources.main#">
INSERT INTO Link_Task_Task (base_task_id, linked_task_id, created_by)
SELECT <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.base_task_id#"> AS base_task_id, task_id AS linked_task_id, #variables.user_identification#
FROM Task
WHERE task_id IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.linked_task_id#" list="true">)
	AND task_id!=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.base_task_id#"> /*don't link a task to itself because that's just dumb*/
</cfquery>
</cfsilent>