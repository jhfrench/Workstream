
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
<cfinclude template="qry_act_generate_invoice.cfm">