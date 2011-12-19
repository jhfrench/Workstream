
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
FROM Emp_Contact, Demographics, Company
WHERE Emp_Contact.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Company.emp_id
	AND Company.company IN (#session.workstream_company_select_list#)
	AND (Demographics.end_date IS NULL
		OR Demographics.end_date > GETDATE())
	AND Emp_Contact.name!=''
	AND GETDATE() BETWEEN effective_from AND ISNULL(effective_to,DATEADD(D,1,GETDATE())) /*use this condition to retrieve only one record per person*/
GROUP BY Emp_Contact.name, Emp_Contact.lname, Demographics.hire_date, Demographics.dob
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>

