
<!--Timekeeping/qry_update_task_description.cfm
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
<cfquery name="update_task_description" datasource="#application.datasources.main#">
UPDATE Task
SET description='#attributes.task_details#'
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

