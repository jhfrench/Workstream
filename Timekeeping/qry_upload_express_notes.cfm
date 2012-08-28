<!--- 
<!--Timekeeping/qry_upload_notes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I upload the info to the Notes table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.notes_#ii#: string that contains the notes that correspond to a particular time entry
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	--> variables.user_identification: id that identifies user to workstream
	--> request.note: string that contains the note that corresponds to a particular time entry
 --->
<cfparam name="attributes.notes_type_id" default=1>
<cfquery name="upload_express_notes" datasource="#application.datasources.main#">
INSERT INTO Notes (task_id, emp_id, notes_type_id,
	note)
VALUES (#listgetat(attributes.task_id,ii)#, #variables.user_identification#, #attributes.notes_type_id#,
	'#HTMLEditFormat(request.note)#')
</cfquery>
</cfsilent>
 --->
<cfser>