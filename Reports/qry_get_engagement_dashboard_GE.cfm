
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
	Revision 1.2  2005/08/26 19:34:35  french
	Improvements to customer-specific engagement dashboard. Task 34802

	Revision 1.1  2005-03-09 13:13:11-05  stetzer
	<>

	Revision 1.0  2002-01-28 09:59:03-05  french
	Initial file creation (files added to RCS by Jeromy on behalf of Adam).

	||
	END FUSEDOC --->
<cfparam name="attributes.sort" default="Customers.description, Project.description">
<cfparam name="customers_id_filter" default="all">
<cfquery name="get_engagement_dashboard" datasource="#application.datasources.main#">
SELECT Project.status, 
	Customers.description AS customers_description, 
	Project.description, Project.project_code, Project.vision, 
	Project.Budget, Project.Mission, Project.budget AS Expr1, 
	REF_Billable.Billable_Type, Project.billable_ID, 
	Project.Active_ID, REF_Active_Indicator.Active_Ind_Type, 
	Flat_Rate.Months, Project.Company_ID, Flat_Rate.End_Date, 
	Flat_Rate.Start_Date, Project.IE_Emp_ID, Emp_Contact.LName, 
	Emp_Contact.Name, Project.Project_ID, Project.Date_Entered,Project.Date_Updated, Project.Project_End,(Project.File_Path) AS File_Path, Project.date_go_live, Project.eng_status	
FROM Project 
	INNER JOIN REF_Billable ON  Project.Billable_ID=REF_Billable.Billable_ID
	INNER JOIN REF_Active_Indicator ON Project.active_id=REF_Active_Indicator.active_ind
	INNER JOIN Customers ON Project.Customers_ID=Customers.Customers_ID
	LEFT OUTER JOIN Emp_Contact ON Project.IE_Emp_ID=Emp_Contact.Emp_ID
	LEFT OUTER JOIN Flat_Rate ON Project.project_id=Flat_Rate.Project_id
WHERE Project.active_id IN (#attributes.inactive#)
	AND Project.status IS NOT NULL
	<!--- THIS LINE IS CRITICAL SO THE WRONG CUSTOMER DOESNT SEE THE WRONG STUFF --->
	AND Project.customers_id=881
	AND Project.status > 0
ORDER BY #attributes.sort#
</cfquery>
</cfsilent>

