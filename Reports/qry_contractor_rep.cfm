
<!--Reports/qry_contractor_rep.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:12:48  stetzer
<>

Revision 1.1  2001-10-11 11:04:02-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->


 <cfquery name="get_Employee_ID" datasource="#application.datasources.main#">
    SELECT Emp_Contact.Emp_ID, Emp_Contact.Name, 
    Emp_Contact.LName, Demographics.pin, 
    REF_companies.Company, 
    (CASE WHEN Security.Disable = 0 THEN 'Active' ELSE 'Inactive'
     END) AS status
FROM Demographics INNER JOIN
    Emp_Contact ON 
    Demographics.Emp_ID = Emp_Contact.Emp_ID INNER JOIN
    Company ON 
    Emp_Contact.Emp_ID = Company.Emp_ID INNER JOIN
    REF_companies ON 
    Company.Company = REF_companies.Company_ID INNER JOIN
    Security ON Emp_Contact.Emp_ID = Security.Emp_ID
WHERE (Demographics.employee_classification_ID = 4) AND 
    (company.Company IN (#session.workstream_company_select_list#)) and Demographics.effective_to is null
   </cfquery>
   </cfsilent>
   