
<!--Timekeeping/qry_edit_notes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the Notes table with the information returned from pag_time_entry_edit.cfm.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> [attributes.delete]: boolean that indicates a the specified record should be deleted from the table. If attributes.delete does not exist than the record should be updated with the provided data.
	--> attributes.note: string containing the text that the user wishes to update the Notes.note field with.
	--> attributes.notes_id: number that corresponds to the identity column of the Notes table.
 --->
<cfquery name="edit_notes" datasource="#application.datasources.main#">
<cfif isdefined("attributes.delete")>
DELETE FROM Notes
<cfelse>
UPDATE Notes
SET date=GETDATE(),
	note='#attributes.note#'
</cfif>
WHERE notes_id=#attributes.notes_id#
</cfquery>
</cfsilent>

