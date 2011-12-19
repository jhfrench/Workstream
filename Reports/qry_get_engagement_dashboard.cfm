
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
	Revision 1.9  2006/05/22 15:19:58  csy
	task44018  More update to make the qry filters on active_ind field

	Revision 1.8  2006-05-22 09:19:26-04  csy
	Task 44018 Updated code  so that qry_get engagement_dashboard actually filters on active_ind instead of always pulling only active engagements.

	Revision 1.7  2006-05-16 13:41:10-04  csy
	Task44018  I got rid of logical condition active_ind to allow filtering on field elements on form at the bottom of  Engagement Dashboad to be applied

	Revision 1.6  2006-05-11 16:01:04-04  csy
	task44018

	Revision 1.5  2006-05-05 18:18:21-04  csy
	task 44018 Make query to filter on inactive attribute instead of always getting only active project.

	Revision 1.4  2005-12-09 17:17:06-05  stetzer
	Added Where item_deleted = 0 to invoice portion of query.

	Revision 1.3  2005-11-07 12:25:38-05  stetzer
	<>

	Revision 1.2  2005-08-26 10:17:11-04  stetzer
	<>

	Revision 1.1  2005-03-09 13:13:08-05  stetzer
	<>

	Revision 1.0  2002-01-28 09:59:03-05  french
	Initial file creation (files added to RCS by Jeromy on behalf of Adam).

	||
	END FUSEDOC --->


<cfparam name="sort" default="Customers.Description,Project.Description">
<cfparam name="IE_Emp_ID_Filter" default="All">
<CFPARAM name="Customers_ID_FIlter" default="All">
<cfparam name= "inactive_ind" default="2">
<cfparam name="attributes.inactive" default="">



<cfquery name="get_engagement_dashboard" datasource="#application.datasources.main#">
SELECT Project.Status, Inner_Query.Total_Bill_Amount,
    Customers.Description AS Customers_Description, 
    Project.Description, Project.Project_Code, Project.Vision, 
    Project.Budget, Project.Mission, Project.Budget AS Expr1, 
    REF_Billable.Billable_Type, Project.Billable_ID, 
    Project.Active_ID, REF_Active_Indicator.Active_Ind_Type, 
    Flat_Rate.Months, Project.Company_ID, Flat_Rate.End_Date, 
    Flat_Rate.Start_Date, Project.IE_Emp_ID, Emp_Contact.LName, 
    Emp_Contact.Name, Project.Project_ID, Project.Date_Entered,Project.Date_Updated, Project.Project_End,(Project.File_Path) as File_Path,Project.Date_Go_Live,Project.Eng_Status, Project.LOE	
FROM Project INNER JOIN
    REF_Billable ON 
    Project.Billable_ID = REF_Billable.Billable_ID INNER JOIN
    REF_Active_Indicator ON 
    Project.Active_ID = REF_Active_Indicator.Active_Ind INNER JOIN
    Customers ON 
    Project.Customers_ID = Customers.Customers_ID LEFT OUTER JOIN
    Emp_Contact ON 
    Project.IE_Emp_ID = Emp_Contact.Emp_ID LEFT OUTER JOIN
    Flat_Rate ON Project.project_id = Flat_Rate.Project_id

    LEFT OUTER JOIN 
	(Select Project_ID,Sum(Total_Bill_Amount) as Total_Bill_Amount
From Billing_History
Where item_deleted = 0
Group by Project_ID) as Inner_Query
	ON Project.Project_ID = Inner_Query.Project_ID
	
WHERE Project.company_id = #session.workstream_company_id#
    AND REF_Active_Indicator.active_ind IN(<cfif attributes.inactive NEQ 0>#attributes.inactive#<cfelse>#inactive_ind#</cfif>)
	AND Project.status IS NOT NULL <cfif comparenocase(IE_Emp_ID_Filter, "ALl")>
	AND Project.ie_emp_id = #ie_emp_id_filter#</cfif><cfif comparenocase(Customers_ID_FIlter, "ALl")>
	AND Project.customers_id = #customers_id_filter#</cfif>
    AND Project.status > 0
ORDER BY #Sort#
</cfquery>
</cfsilent>





