
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
<cfparam name="attributes.sort" default="Customers.description, Project.description">
<cfparam name="customer_id_filter" default="all">
<cfquery name="get_engagement_dashboard" datasource="#application.datasources.main#">
SELECT Project.status, Customer.description AS customer_description, Project.description,
	Project.project_code, Project.vision, Project.budget,
	Project.Mission, REF_Billable.Billable_Type,
	Project.billable_type_id, Project.Active_InD, REF_Active_Indicator.Active_Ind_Type,
	Flat_Rate.Months, Project.company_id, Flat_Rate.End_Date,
	Flat_Rate.Start_Date, Project.IE_Emp_ID, Emp_Contact.LName,
	Emp_Contact.Name, Project.project_id, Project.date_entered,
	Project.Date_Updated, Project.Project_End, Project.File_Path,
	Project.date_go_live, Project.eng_status
FROM Project 
	INNER JOIN REF_Billable ON  Project.billable_type_id=REF_Billable.billable_type_id
	INNER JOIN REF_Active_Indicator ON Project.active_ind=REF_Active_Indicator.active_ind
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN Emp_Contact ON Project.IE_Emp_ID=Emp_Contact.emp_id
	LEFT OUTER JOIN Flat_Rate ON Project.project_id=Flat_Rate.project_id
WHERE Project.active_ind IN (#attributes.inactive#)
	AND Project.status IS NOT NULL
	<!--- THIS LINE IS CRITICAL SO THE WRONG CUSTOMER DOESNT SEE THE WRONG STUFF
	AND Project.customer_id=881 --->
	AND Project.status > 0
ORDER BY #attributes.sort#
</cfquery>
</cfsilent>

