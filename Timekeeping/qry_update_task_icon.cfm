
<!--Timekeeping/qry_update_task_icon.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task icon.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_icon" datasource="#application.datasources.main#">
UPDATE Task
SET icon_id=#attributes.icon_id#
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

