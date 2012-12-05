
<!--Tools/act_generate_invoice.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I execute the Act_Generate_Invoice stored procedure. This stored procedure takes a customer_id and a created_by, looks up the relevant billable data, makes the relevant inserts into Invoice, Link_Invoice_Time_Entry and Billing_History, and returns data that is used to create the Excel spreadsheet that is sent to the customer.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>

<cfset variables.continue_processing_ind=1>
<cftry>
	<cfinclude template="qry_act_generate_invoice.cfm">
	<cfcatch type="Database">
		<cfset variables.continue_processing_ind=0>
		<cfoutput>
		<cfif NOT comparenocase(cfcatch.message,"ERROR: One or more employees are missing a billing rate.")>
			<a href="index.cfm?fuseaction=Tools.rate_change">#cfcatch.message#</a>
		<cfelseif variables.user_identification EQ 1>
			<h1>Database Error</h1>
			<dl>
				<dt>Message</dt>
				<dd>#cfcatch.message#</dd>
				<dt>Native error code</dt>
				<dd>#cfcatch.nativeerrorcode#</dd>
				<dt>SQLState</dt>
				<dd>#cfcatch.sqlstate#</dd>
				<dt>Detail</dt>
				<dd>#cfcatch.detail#</dd>
			</dl>
		</cfif>
		</cfoutput>
	</cfcatch>
</cftry>