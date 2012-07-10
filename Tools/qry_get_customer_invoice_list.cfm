
<!--Tools/qry_get_customer_invoice_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_customer_invoice_list" datasource="#application.datasources.main#">
SELECT Customer.customer_id, Customer.description AS customer_name, SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS revenue
FROM Time_Entry
	INNER JOIN Link_Company_Emp_Contact ON Time_Entry.emp_id=Link_Company_Emp_Contact.emp_id
	LEFT OUTER JOIN Billing_Rate ON Time_Entry.emp_id=Billing_Rate.emp_id
		AND Time_Entry.date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
	INNER JOIN Project ON Project.project_id=Time_Entry.project_id
		AND Project.project_id=Billing_Rate.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
WHERE Project.billable_type_id=1
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)<cfif isdefined("attributes.invoice_id")>
	AND Time_Entry.time_entry_id IN (
		SELECT time_entry_id
		FROM Link_Invoice_Time_Entry
		WHERE active_ind=1
			AND invoice_id=#attributes.invoice_id#
	)<cfelseif isdefined("attributes.month") AND isdefined("attributes.year")>
	AND MONTH(Time_Entry.date)=#attributes.month#
	AND YEAR(Time_Entry.date)=#attributes.year#<cfelse>
	AND Time_Entry.time_entry_id NOT IN (
		SELECT time_entry_id
		FROM Link_Invoice_Time_Entry
		WHERE active_ind=1
	)</cfif>
GROUP BY Customer.customer_id, Customer.description
ORDER BY Customer.description
</cfquery>