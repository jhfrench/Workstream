
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
    SELECT Emp_Contact.emp_id, Emp_Contact.Name, 
    Emp_Contact.LName, Demographics.pin, 
    REF_Company.company, 
    (CASE WHEN Security.Disable = 0 THEN 'Active' ELSE 'Inactive'
     END) AS status
FROM Demographics
	INNER JOIN Emp_Contact ON Demographics.emp_id = Emp_Contact.emp_id
	INNER JOIN Company ON Emp_Contact.emp_id = Company.emp_id
	INNER JOIN REF_Company ON Company.Company = REF_Company.Company_ID
	INNER JOIN Security ON Emp_Contact.emp_id = Security.emp_id
WHERE (Demographics.employee_classification_id = 4)
	AND (company.Company IN (#session.workstream_company_select_list#)) and Demographics.effective_to IS NULL
   </cfquery>
   </cfsilent>
   