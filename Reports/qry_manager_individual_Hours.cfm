
<!--Reports/qry_manager_individual_Hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfquery name="name" datasource="#application.datasources.main#">          
SELECT REF_Company.description AS company, Emp_Contact.name, 
    Emp_Contact.lname, Emp_Contact.emp_id
FROM Link_Company_Emp_Contact
	INNER JOIN Emp_Contact ON Link_Company_Emp_Contact.emp_id = Emp_Contact.emp_id
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id = REF_Company.company_id
	INNER JOIN Security ON Emp_Contact.emp_id = Security.emp_id
WHERE security.disable <> 1
	AND emp_contact.emp_id = #attributes.emp_id#
ORDER BY lname, name
</cfquery>
