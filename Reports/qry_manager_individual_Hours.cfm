
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
SELECT REF_Company.company, Emp_Contact.name, 
    Emp_Contact.lname, Emp_Contact.emp_id
FROM Company
	INNER JOIN Emp_Contact ON Company.emp_id = Emp_Contact.emp_id
	INNER JOIN REF_Company ON Company.Company = REF_Company.Company_ID
	INNER JOIN Security ON Emp_Contact.emp_id = Security.emp_id
WHERE security.disable <> 1
	AND emp_contact.emp_id = #attributes.emp_id#
ORDER BY lname, name
</cfquery>
