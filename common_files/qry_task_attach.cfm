
<!--common_files/qry_task_attach.cfm
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
<cfquery name="task_attach" datasource="#application.datasources.main#">
INSERT INTO Link_Task_Task (base_task_id, linked_task_id)
SELECT #attributes.base_task_id# AS base_task_id, task_id AS linked_task_id
FROM Task
WHERE task_id IN (#attributes.linked_task_id#)
</cfquery>
</cfsilent>

