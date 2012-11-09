
<!--Reports/qry_anniv_report.cfm
	Author: Jeromy F -->
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
	DATEDIFF(M, Demographics.hire_date, CURRENT_TIMESTAMP)/12.0 AS years_employed, Demographics.dob
FROM Emp_Contact, View_Demographics_Workstream Demographics, Link_Company_Emp_Contact
WHERE Emp_Contact.user_account_id=Demographics.user_account_id
	AND Emp_Contact.user_account_id=Link_Company_Emp_Contact.user_account_id
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND (Demographics.effective_to IS NULL OR Demographics.effective_to > CURRENT_TIMESTAMP)
	AND Emp_Contact.name!=''
	AND CURRENT_TIMESTAMP BETWEEN hire_date AND COALESCE(effective_to,CURRENT_TIMESTAMP+interval '1 day') /*use this condition to retrieve only one record per person*/
GROUP BY Emp_Contact.name, Emp_Contact.lname, Demographics.hire_date, Demographics.dob
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>

