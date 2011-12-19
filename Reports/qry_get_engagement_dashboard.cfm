
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
<cfparam name="sort" default="Customer.description, Project.description">
<cfparam name="IE_Emp_ID_Filter" default="All">
<cfparam name="customer_id_FIlter" default="All">
<cfparam name= "inactive_ind" default="1">
<cfparam name="attributes.inactive" default="">

<cfquery name="get_engagement_dashboard" datasource="#application.datasources.main#">
SELECT Project.Status, Inner_Query.Total_Bill_Amount, Customer.Description AS customer_description,
	Project.Description, Project.project_code, Project.Vision,
	Project.budget, Project.Mission, REF_Billable.Billable_Type,
	Project.billable_type_id, Project.Active_InD, REF_Active_Indicator.Active_Ind_Type,
	Flat_Rate.Months, Project.Company_ID, Flat_Rate.End_Date,
	Flat_Rate.Start_Date, Project.IE_Emp_ID, Emp_Contact.LName,
	Emp_Contact.Name, Project.project_id, Project.date_entered,
	Project.Date_Updated, Project.Project_End, Project.file_path,
	Project.Date_Go_Live, Project.Eng_Status, Project.LOE	
FROM Project
	INNER JOIN REF_Billable ON Project.billable_type_id = REF_Billable.billable_type_id
	INNER JOIN REF_Active_Indicator ON Project.Active_InD = REF_Active_Indicator.Active_Ind
	INNER JOIN Customer ON Project.customer_id = Customer.customer_id
	LEFT OUTER JOIN Emp_Contact ON Project.IE_Emp_ID = Emp_Contact.Emp_ID
	LEFT OUTER JOIN Flat_Rate ON Project.project_id = Flat_Rate.project_id
    LEFT OUTER JOIN (
		SELECT project_id,SUM(Total_Bill_Amount) AS Total_Bill_Amount
		FROM Billing_History
		WHERE item_deleted = 0
		GROUP BY project_id
	) as Inner_Query ON Project.project_id = Inner_Query.project_id
WHERE Project.company_id = #session.workstream_company_id#
    AND REF_Active_Indicator.active_ind IN(<cfif attributes.inactive NEQ 0>#attributes.inactive#<cfelse>#inactive_ind#</cfif>)
	AND Project.status IS NOT NULL <cfif comparenocase(IE_Emp_ID_Filter, "ALl")>
	AND Project.ie_emp_id = #ie_emp_id_filter#</cfif><cfif comparenocase(customer_id_FIlter, "ALl")>
	AND Project.customer_id = #customer_id_filter#</cfif>
    AND Project.status > 0
ORDER BY #sort#
</cfquery>
</cfsilent>





