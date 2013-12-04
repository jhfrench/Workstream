
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
<cfquery name="get_check_previous_invoice" datasource="#application.datasources.main#">
SELECT time_entry_id
FROM Link_Invoice_Time_Entry
	INNER JOIN Invoice ON Link_Invoice_Time_Entry.invoice_id=Invoice.invoice_id
		AND Invoice.active_ind=1
WHERE Link_Invoice_Time_Entry.active_ind=1
	AND Link_Invoice_Time_Entry.time_entry_id=<cfqueryparam value="#attributes.time_entry_id#" cfsqltype="cf_sql_integer" />
GROUP BY time_entry_id
</cfquery>
<cfif get_check_previous_invoice.recordcount EQ 0>
	<cftransaction>
		<cfinclude template="qry_update_notes.cfm">
		<cfinclude template="qry_update_time_entry.cfm">
	</cftransaction>
	<div class="alert alert-success">
		<strong>Mos Def</strong>
		<p>That time entry is updated.</p>
		<p>You can <a href="index.cfm?fuseaction=<cfoutput>#attributes.given_referer#</cfoutput>">return</a> to what you were doing.</p>
	</div>
<cfelse>
	<div class="alert alert-error">
		<strong>Wha?!</strong>
		<p>That time entry has already been invoiced.</p>
		<p>You can <a href="index.cfm?fuseaction=<cfoutput>#attributes.given_referer#</cfoutput>">return</a> to what you were doing.</p>
	</div>
</cfif>