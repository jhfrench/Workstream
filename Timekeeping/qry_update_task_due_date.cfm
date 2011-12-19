
<!--Timekeeping/qry_update_task_due_date.cfm
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
<cfquery name="update_task_due_date" datasource="#application.datasources.main#">
UPDATE Task
SET due_date=#CreateODBCDate(attributes.due_date)#
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

