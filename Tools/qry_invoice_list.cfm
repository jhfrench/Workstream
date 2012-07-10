
<!--Tools/qry_invoice_list.cfm
	Author: Jeromy F  -->
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
<cfparam name="run_post" default="0">
<cfquery name="invoice_list" datasource="#application.datasources.main#">
SELECT Customer.customer_id, Customer.root_code, Customer.description AS customer_name,
	Project.project_id, Project.project_code, Project.description AS project_name, 
	REF_Billable.billable_type_id, REF_Billable.billable_type, SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS revenue, COUNT(DISTINCT Time_Entry.task_id) AS total_tasks
FROM Time_Entry
	INNER JOIN Link_Company_Emp_Contact ON Time_Entry.emp_id=Link_Company_Emp_Contact.emp_id
	LEFT OUTER JOIN Billing_Rate ON Time_Entry.emp_id=Billing_Rate.emp_id
		AND Time_Entry.date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
	INNER JOIN Project ON Project.project_id=Time_Entry.project_id
		AND Project.project_id=Billing_Rate.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
	LEFT OUTER JOIN REF_Billable ON Project.billable_type_id=REF_Billable.billable_type_id
WHERE Project.billable_type_id=1
	AND Customer.customer_id=#attributes.customer_id#
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
GROUP BY Customer.customer_id, Customer.root_code, Customer.description,
	Project.project_id, Project.project_code, Project.description, 
	REF_Billable.billable_type_id, REF_Billable.billable_type
ORDER BY Customer.root_code, Project.project_code
</cfquery>
</cfsilent>

