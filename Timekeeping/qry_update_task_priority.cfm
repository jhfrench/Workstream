
<!--Timekeeping/qry_update_task_priority.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task owner.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_priority" datasource="#application.datasources.main#">
UPDATE Task
SET priority_id=#attributes.priority_id#
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

