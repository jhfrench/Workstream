
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
<cfparam name="attributes.sort" default="Customer.description, Project.description">
<cfquery name="get_engagement_dashboard" datasource="#application.datasources.main#">
SELECT Project.status, Customer.description AS customer_description, Project.description,
	Project.project_code, Project.vision, Project.budget,
	Project.Mission, REF_Billable.description AS Billable_Type,
	Project.billable_type_id, Project.active_ind, REF_Active_Indicator.active_ind_Type,
	Project.company_id, Flat_Rate.rate_end_date,
	Flat_Rate.rate_start_date, Project.project_manager_user_account_id, Emp_Contact.lname,
	Emp_Contact.Name, Project.project_id, Project.created_date,
	Project.Date_Updated, Project.Project_End, Project.File_Path,
	Project.date_go_live, Project.eng_status
FROM Project 
	INNER JOIN REF_Billable ON  Project.billable_type_id=REF_Billable.billable_type_id
	INNER JOIN REF_Active_Indicator ON Project.active_ind=REF_Active_Indicator.active_ind
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN Emp_Contact ON Project.project_manager_user_account_id=Emp_Contact.user_account_id
	LEFT OUTER JOIN Flat_Rate ON Project.project_id=Flat_Rate.project_id
		AND Flat_Rate.active_ind=1
WHERE Project.active_ind=#attributes.active_ind#
	AND Project.status IS NOT NULL
	<!--- THIS LINE IS CRITICAL SO THE WRONG CUSTOMER DOESNT SEE THE WRONG STUFF --->
	AND Project.customer_id=881
	AND Project.status > 0
ORDER BY #attributes.sort#
</cfquery>
</cfsilent>

