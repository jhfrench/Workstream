
<!--Tools/qry_get_invoice_previous.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Show table of past invoices (Customer, Date, Billed Amount, Status (paid/not paid))
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_invoice_previous" datasource="#application.datasources.main#">
/*previosuly billed*/
SELECT Invoice.invoice_id, Invoice.created_date, Customer.customer_id,
	Customer.sort_order, Customer.description AS customer_name, Demographics.last_name||', '||Demographics.first_name AS invoicer,
	SUM(Billing_History.total_bill_amount) AS invoice_bill_amount, COALESCE(Invoice.payment_received_amount,0) AS invoice_received_amount
FROM Invoice
	INNER JOIN Billing_History ON Invoice.invoice_id=Billing_History.invoice_id
		AND Billing_History.active_ind=1
	INNER JOIN Project ON Billing_History.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Demographics ON Invoice.created_by=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Invoice.active_ind=1
GROUP BY Invoice.invoice_id, Invoice.created_date, Invoice.payment_received_amount,
	Customer.customer_id, Customer.sort_order, Customer.description,
	Demographics.last_name, Demographics.first_name
ORDER BY Customer.sort_order, Invoice.created_date
</cfquery>
<cfquery dbtype="query" name="get_invoice_previous_total">
SELECT SUM(invoice_bill_amount) AS invoice_bill_amount, SUM(invoice_received_amount) AS invoice_received_amount
FROM get_invoice_previous
</cfquery>