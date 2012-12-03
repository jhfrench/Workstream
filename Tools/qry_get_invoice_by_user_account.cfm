
<!--Tools/qry_get_invoice_by_user_account.cfm
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
<cfquery name="get_invoice_by_user_account" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name||', '||Demographics.first_name AS employee, Project.description AS project_name,
	Billing_Rate.rate, REF_Billable_Type.billable_type_id, REF_Billable_Type.description AS billable_type,
	SUM(Time_Entry.hours) AS hours, SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS bill
FROM Time_Entry
	INNER JOIN Billing_Rate ON Time_Entry.user_account_id=Billing_Rate.user_account_id
		AND Time_Entry.project_id=Billing_Rate.project_id
		AND Time_Entry.work_date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id<cfif NOT attributes.invoice_id>
		AND Project.project_id=#attributes.project_id#</cfif>
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
	INNER JOIN Demographics ON Time_Entry.created_by=Demographics.user_account_id
		AND Demographics.active_ind=1
	LEFT OUTER JOIN Link_Invoice_Time_Entry ON Time_Entry.time_entry_id=Link_Invoice_Time_Entry.time_entry_id
		AND Link_Invoice_Time_Entry.active_ind=1
		AND Link_Invoice_Time_Entry.invoice_id=#attributes.invoice_id#
WHERE Time_Entry.active_ind=1
	AND Link_Invoice_Time_Entry.l_i_t_e_id IS <cfif attributes.invoice_id>NOT</cfif> NULL
GROUP BY Demographics.user_account_id, Demographics.last_name, Demographics.first_name,
	Project.description, Billing_Rate.rate, REF_Billable_Type.billable_type_id,
	REF_Billable_Type.description
ORDER BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
</cfquery>
<cfquery dbtype="query" name="get_invoice_by_user_account_total">
SELECT SUM(hours) AS hours, SUM(bill) AS bill
FROM get_invoice_by_user_account
</cfquery>