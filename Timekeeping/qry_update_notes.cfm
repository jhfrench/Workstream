
<!--Timekeeping/qry_update_notes.cfm
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
<cfquery name="update_notes" datasource="#application.datasources.main#">
UPDATE Notes
SET active_ind=0
WHERE notes_id=<cfqueryparam value="#attributes.notes_id#" cfsqltype="cf_sql_integer" />
	/*don't update or delete invoiced time*/
	AND notes_id NOT IN (
		SELECT Time_Entry.notes_id
		FROM Link_Invoice_Time_Entry
			INNER JOIN Time_Entry ON Link_Invoice_Time_Entry.time_entry_id=Time_Entry.time_entry_id
		WHERE Link_Invoice_Time_Entry.active_ind=1
	);
<cfif isdefined("attributes.method") AND comparenocase(attributes.method,"delete this entry")>
INSERT INTO Notes (user_account_id, notes_type_id, note,
	task_id, created_by)
SELECT user_account_id, <cfqueryparam value="#attributes.notes_type_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#htmleditformat(attributes.note)#" cfsqltype="cf_sql_longvarchar" />,
	task_id, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
FROM Notes
WHERE notes_id=<cfqueryparam value="#attributes.notes_id#" cfsqltype="cf_sql_integer" />
	/*don't update or delete invoiced time*/
	AND notes_id NOT IN (
		SELECT Time_Entry.notes_id
		FROM Link_Invoice_Time_Entry
			INNER JOIN Time_Entry ON Link_Invoice_Time_Entry.time_entry_id=Time_Entry.time_entry_id
		WHERE Time_Entry.active_ind=1
			AND Link_Invoice_Time_Entry.active_ind=1
	)
RETURNING notes_id
</cfif>
</cfquery>
</cfsilent>
