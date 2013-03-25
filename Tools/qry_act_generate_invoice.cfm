
<!--Tools/qry_act_generate_invoice.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Show table of past invoices (Customer, Date, Billed Amount, Status (paid/not paid) on to and un-invoiced time grouped by customer
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfquery name="act_generate_invoice" datasource="#application.datasources.main#">
SELECT *
FROM Act_Generate_Invoice(#attributes.customer_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);
</cfquery>