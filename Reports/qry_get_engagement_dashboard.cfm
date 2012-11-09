
<!--Reports/qry_get_engagement_dashboard.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am not properly docummented by the file's author.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="1">
<cfparam name="attributes.customer_id" default="0">
<cfparam name="attributes.project_manager_id" default="0">
<cfparam name="attributes.sort" default="Customer.description, Project.description">
</cfsilent>

<cfquery name="get_engagement_dashboard" datasource="#application.datasources.main#">
SELECT Project.project_id, Project.project_code, Project.description,
	Project.company_id, Project.project_manager_id, Project.created_date,
	COALESCE(Project.date_go_live, Project.project_end) AS deadline_date, Project.status, Project.eng_status,
	Project.billable_type_id, Project.loe, Project.budget,
	Project.mission, Project.vision, Project.date_updated,
	Project.file_path, Project.active_ind, Customer.description AS customer_description, 
	Billing_History.total_bill_amount, REF_Billable_Type.description AS billable_type, REF_Active_Indicator.active_ind_type,
	Customer.customer_id, Flat_Rate.rate_end_date, Flat_Rate.rate_start_date,
	Emp_Contact.lname, Emp_Contact.name
FROM Project
	INNER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
	INNER JOIN REF_Active_Indicator ON Project.active_ind = REF_Active_Indicator.active_ind
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN Emp_Contact ON Project.project_manager_id=Emp_Contact.user_account_id
	LEFT OUTER JOIN Flat_Rate ON Project.project_id = Flat_Rate.project_id
		AND Flat_Rate.active_ind=1
    LEFT OUTER JOIN (
		SELECT project_id,SUM(total_bill_amount) AS total_bill_amount
		FROM Billing_History
		WHERE active_ind=1
		GROUP BY project_id
	) AS Billing_History ON Project.project_id=Billing_History.project_id
WHERE COALESCE(Project.status,0) > 0
    AND Project.company_id=#session.workstream_company_id#<cfif attributes.project_manager_id NEQ 0>
	AND Project.project_manager_id=#attributes.project_manager_id#</cfif><cfif attributes.customer_id NEQ 0>
	AND Project.customer_id=#attributes.customer_id#</cfif>
    AND REF_Active_Indicator.active_ind=#attributes.active_ind#
ORDER BY #attributes.sort#
</cfquery>





