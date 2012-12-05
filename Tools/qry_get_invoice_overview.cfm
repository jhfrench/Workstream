
<!--Tools/qry_get_invoice_overview.cfm
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
<cfquery name="get_invoice_overview" datasource="#application.datasources.main#">
SELECT 1 AS major_sort_order, Invoice.invoice_id, Invoice.created_date,
	Customer.customer_id, Customer.sort_order, Customer.description AS customer_name,
	Demographics.last_name||', '||Demographics.first_name AS invoicer, SUM(Billing_History.total_bill_amount) AS invoice_bill_amount, COALESCE(Invoice.payment_received_amount,0) AS invoice_received_amount,
	0 AS show_generate_button_ind
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
UNION ALL
SELECT 2 AS major_sort_order, 0 AS invoice_id, NULL AS created_date,
	Customer.customer_id, Customer.sort_order, Customer.description AS customer_name,
	NULL AS invoicer, SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS invoice_bill_amount, 0 AS invoice_received_amount,
	1 AS show_generate_button_ind
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Billing_Rate ON Time_Entry.user_account_id=Billing_Rate.user_account_id
		AND Billing_Rate.active_ind=1
		AND Time_Entry.project_id=Billing_Rate.project_id
		AND Time_Entry.work_date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
WHERE Time_Entry.active_ind=1
	AND Time_Entry.time_entry_id NOT IN (SELECT Link_Invoice_Time_Entry.time_entry_id FROM Link_Invoice_Time_Entry WHERE Link_Invoice_Time_Entry.active_ind=1)
	AND Time_Entry.work_date <  DATE_TRUNC('MONTH', CURRENT_TIMESTAMP) /*previous months are elligible for invoicing*/
GROUP BY Customer.customer_id, Customer.sort_order, Customer.description
UNION ALL
SELECT 3 AS major_sort_order, 0 AS invoice_id, NULL AS created_date,
	Customer.customer_id, Customer.sort_order, Customer.description AS customer_name,
	NULL AS invoicer, SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS invoice_bill_amount, 0 AS invoice_received_amount,
	0 AS show_generate_button_ind
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Billing_Rate ON Time_Entry.user_account_id=Billing_Rate.user_account_id
		AND Billing_Rate.active_ind=1
		AND Time_Entry.project_id=Billing_Rate.project_id
		AND Time_Entry.work_date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
WHERE Time_Entry.active_ind=1
	AND Time_Entry.time_entry_id NOT IN (SELECT Link_Invoice_Time_Entry.time_entry_id FROM Link_Invoice_Time_Entry WHERE Link_Invoice_Time_Entry.active_ind=1)
	AND DATE_TRUNC('MONTH', Time_Entry.work_date)=DATE_TRUNC('MONTH', CURRENT_TIMESTAMP) /*don't invoice anything from the current month*/
GROUP BY Customer.customer_id, Customer.sort_order, Customer.description
ORDER BY major_sort_order, sort_order, created_date
</cfquery>
<cfquery dbtype="query" name="get_invoice_overview_total">
SELECT SUM(invoice_bill_amount) AS invoice_bill_amount, SUM(invoice_received_amount) AS invoice_received_amount
FROM get_invoice_overview
</cfquery>