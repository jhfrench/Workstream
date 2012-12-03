
<!--Tools/qry_get_invoice_detail.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the modules that a user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_invoice_detail" datasource="#application.datasources.main#">
SELECT Customer.description AS customer_name, Project.project_id, Project.description AS project_name,
	Project.project_code, Demographics.last_name||', '||Demographics.first_name AS invoicer,
	Invoice_Detail.created_date, Invoice_Detail.total_bill_amount, Invoice_Detail.payment_received_amount,
	REF_Billable_Type.description AS billable_type
FROM (<cfif attributes.invoice_id>
		SELECT Billing_History.project_id, Billing_History.total_bill_amount, Billing_History.payment_received_amount,
			Billing_History.created_by, Billing_History.created_date
		FROM Billing_History
		WHERE Billing_History.active_ind=1
			AND Billing_History.invoice_id=#attributes.invoice_id#
	<cfelse>
		SELECT Time_Entry.project_id, SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS total_bill_amount, 0 AS payment_received_amount,
			0 AS created_by, NULL AS created_date
		FROM Time_Entry
			INNER JOIN Billing_Rate ON Time_Entry.user_account_id=Billing_Rate.user_account_id
				AND Time_Entry.project_id=Billing_Rate.project_id
				AND Time_Entry.work_date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.time_entry_id NOT IN (SELECT Link_Invoice_Time_Entry.time_entry_id FROM Link_Invoice_Time_Entry WHERE Link_Invoice_Time_Entry.active_ind=1)
		GROUP BY Time_Entry.project_id
	</cfif>
	) AS Invoice_Detail
	INNER JOIN Project ON Invoice_Detail.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
		AND Customer.customer_id=2--#attributes.customer_id#
	INNER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
	LEFT OUTER JOIN Demographics ON Invoice_Detail.created_by=Demographics.user_account_id
		AND Demographics.active_ind=1
ORDER BY Customer.sort_order, Project.project_code, Invoice_Detail.created_date
</cfquery>
<cfquery dbtype="query" name="get_invoice_detail_total">
SELECT SUM(total_bill_amount) AS total_bill_amount, SUM(payment_received_amount) AS payment_received_amount
FROM get_invoice_detail
</cfquery>