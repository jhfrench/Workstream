
<!--Tools/qry_get_invoice_future.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Show invoice data for work that is not yet eligible to be invoiced.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_invoice_future" datasource="#application.datasources.main#">
/*time entered, but not yet eligible to be billed*/
SELECT Customer.customer_id, Customer.sort_order, Customer.description AS customer_name,
	SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS invoice_bill_amount
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Billing_Rate ON Time_Entry.user_account_id=Billing_Rate.user_account_id
		AND Billing_Rate.active_ind=1
		AND Time_Entry.project_id=Billing_Rate.project_id
		AND Time_Entry.work_date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
WHERE Time_Entry.active_ind=1
	AND Time_Entry.time_entry_id NOT IN (SELECT Link_Invoice_Time_Entry.time_entry_id FROM Link_Invoice_Time_Entry WHERE Link_Invoice_Time_Entry.active_ind=1)
	AND Time_Entry.work_date >= DATE_TRUNC('MONTH', CURRENT_TIMESTAMP)
GROUP BY Customer.customer_id, Customer.sort_order, Customer.description
ORDER BY Customer.sort_order
</cfquery>
<cfquery dbtype="query" name="get_invoice_future_total">
SELECT SUM(invoice_bill_amount) AS invoice_bill_amount
FROM get_invoice_future
</cfquery>