
<!--Timekeeping/qry_update_task_name.cfm
	Author: Jeromy F and Matt T -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task name.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_status" datasource="#application.datasources.main#">
UPDATE Task
SET name='#attributes.task_name#'
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

