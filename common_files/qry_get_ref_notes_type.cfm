
<!--Timekeeping/qry_get_ref_notes_type.cfm
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
<cfquery name="get_ref_notes_type" datasource="#application.datasources.main#">
SELECT notes_type_id, notes_type
FROM REF_Notes_Type
ORDER BY sort_order
</cfquery>
</cfsilent>