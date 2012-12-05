
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
<cfquery name="get_customer_invoice_details" datasource="#application.datasources.main#">
SELECT Customer.root_code, Customer.abbreviation, Customer.description AS customer_name,
	Customer.company_address1, Customer.company_address2, Customer.company_city,
	Customer.company_state, Customer.company_zip, Demographics.last_name,
	Demographics.first_name, Demographics.email_address, Demographics.work_phone
FROM Customer
	LEFT OUTER JOIN Demographics ON Customer.contact_user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Customer.customer_id=#attributes.customer_id#
</cfquery>
<cftry>
	<cfinclude template="qry_act_generate_invoice.cfm">
	<cfcatch type="Database">
		<cfset variables.continue_processing_ind=0>
		<cfoutput>
		<div class="alert alert-error">
		<cfif NOT comparenocase(cfcatch.message,"ERROR: One or more employees are missing a billing rate.")>
			<h1>Uh oh</h1>
			<p>#cfcatch.message#</p>
			<a href="index.cfm?fuseaction=Tools.rate_change">Please create the necessary billing rates for customer #get_customer_invoice_details.description#.</a>
		<cfelseif variables.user_identification EQ 1>
			<h1 class="text-error">Database Error</h1>
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
		</div>
		</cfoutput>
	</cfcatch>
</cftry>

<cfif variables.continue_processing_ind>
	<cfquery dbtype="query" name="get_invoice_project_summary">
	SELECT project_id, project_code, project_name,
		COUNT(*) AS entry_count
	FROM act_generate_invoice
	GROUP BY project_id, project_code, project_name
	ORDER BY project_code, project_name
	</cfquery>
</cfif>
