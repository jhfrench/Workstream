
<!--report/qry_undertime_Report_name.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets the people for the undertime report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:15:06  stetzer
<>

Revision 1.1  2001-10-11 11:03:48-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="get_name" datasource="#application.datasources.main#">
SELECT Emp_Contact.Name, Emp_Contact.LName, 
    REF_Employee_Classification.employee_classification, 
    Emp_Contact.Emp_ID AS pin, SUM(Time_Entry.Hours) 
    AS Total_hours
FROM Emp_Contact INNER JOIN
    Time_Entry ON 
    Emp_Contact.Emp_ID = Time_Entry.Emp_ID INNER JOIN
    Demographics ON 
    Emp_Contact.Emp_ID = Demographics.Emp_ID INNER JOIN
    Security ON 
    Emp_Contact.Emp_ID = Security.Emp_ID INNER JOIN
    Company ON 
    Emp_Contact.Emp_ID = Company.Emp_ID INNER JOIN
    REF_companies ON 
    Company.Company = REF_companies.Company_ID INNER JOIN
    Link_Company_Emp_Contact ON 
    Emp_Contact.Emp_ID = Link_Company_Emp_Contact.emp_id LEFT OUTER
     JOIN
    REF_Employee_Classification ON 
    Demographics.employee_classification_ID = REF_Employee_Classification.employee_classification_ID

WHERE security.disable <> 1 and ((Time_entry.date>='#start_date#') AND 
    (Time_entry.date<='#end_Date#'))  and demographics.overtime =1 <cfif compareNoCase(attributes.pin, "all")>and Emp_Contact.Emp_ID in (#attributes.pin#)<cfelse>AND Link_Company_Emp_Contact.company_id in(#session.workstream_company_select_list#)</cfif>
GROUP BY Emp_Contact.Name, Emp_Contact.LName, 
    REF_Employee_Classification.employee_classification, Emp_Contact.Emp_ID
</cfquery>
</cfsilent>
