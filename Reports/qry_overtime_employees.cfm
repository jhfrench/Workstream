
<!--Reports/qry_overtime_employees.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the list of people that are elligible for overtime.  For the overtime report imput screen

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:28  stetzer
<>

Revision 1.1  2001-10-11 11:03:53-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<cfquery name="get_overtime_employees" datasource="#application.datasources.main#">          
SELECT Emp_Contact.name, Emp_Contact.lname, 
    Demographics.pin, Demographics.emp_id
FROM Demographics, Emp_Contact, Security, Company
WHERE Demographics.emp_id = Emp_Contact.emp_id
	AND Emp_Contact.emp_id = Security.emp_id
	AND Emp_Contact.emp_id = Company.emp_id
	AND Security.disable != 1
	AND Demographics.effective_to IS NULL
	AND company.company IN (#session.workstream_company_select_list#)
	AND demographics.overtime = 1
ORDER BY Emp_Contact.lName, Emp_Contact.Name
</cfquery>	
</cfsilent>
