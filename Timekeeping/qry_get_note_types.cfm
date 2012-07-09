
<!--Timekeeping/qry_get_note_types.cfm
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
	--> attributes.task_id: list that contains task id's submitted from the express timekeeping page
 --->
<cfquery name="get_note_types" datasource="#application.datasources.main#">
SELECT notes_type_id, notes_type
FROM REF_Notes_Type
WHERE notes_type_id IN (1,2<cfif NOT get_task_details.task_read>,3</cfif>)
ORDER BY sort_order
</cfquery>
</cfsilent>

