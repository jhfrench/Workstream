
<!--Reports/qry_anniv_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the anniversary report.

	||
	$Log$
	Revision 1.2  2006/05/02 07:03:21  french
	Added condition to limit results to only one record per employee.

	||
	END FUSEDOC --->

<cfquery name="annivarsary" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Demographics.hire_date,
	DATEDIFF(M, Demographics.hire_date, GETDATE())/12.0 AS years_employed, Demographics.dob
FROM Emp_Contact, Demographics_Ngauge Demographics, Link_Company_Emp_Contact
WHERE Emp_Contact.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND (Demographics.end_date IS NULL
		OR Demographics.end_date > GETDATE())
	AND Emp_Contact.name!=''
	AND GETDATE() BETWEEN effective_from AND COALESCE(effective_to,DATEADD(D,1,GETDATE())) /*use this condition to retrieve only one record per person*/
GROUP BY Emp_Contact.name, Emp_Contact.lname, Demographics.hire_date, Demographics.dob
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>

