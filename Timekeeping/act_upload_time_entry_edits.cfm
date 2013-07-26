
<!--Timekeeping/act_upload_time_entry_edits.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I call the queries that update the Notes and Time_Entry tables with the information returned from pag_time_entry_edit.cfm.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cftransaction>
	<cfinclude template="qry_update_notes.cfm">
	<cfinclude template="qry_update_time_entry.cfm">
</cftransaction>
