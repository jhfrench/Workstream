
<!--Reports/qry_manager_individual_Hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:13  stetzer
<>

Revision 1.1  2001-10-11 11:03:55-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfquery name="name" datasource="#application.datasources.main#">          
SELECT REF_companies.Company, Emp_Contact.Name, 
    Emp_Contact.LName, Emp_Contact.Emp_ID
FROM Company INNER JOIN
    Emp_Contact ON 
    Company.Emp_ID = Emp_Contact.Emp_ID INNER JOIN
    REF_companies ON 
    Company.Company = REF_companies.Company_ID INNER JOIN
    Security ON Emp_Contact.Emp_ID = Security.Emp_ID
WHERE security.disable <> 1 and emp_contact.emp_id = #attributes.emp_id#
ORDER BY lname, name
</cfquery>
