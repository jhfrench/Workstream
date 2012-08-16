
<!--Reports/qry_overtime_employees.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the list of people that are elligible for overtime.  For the overtime report imput screen

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_overtime_employees" datasource="#application.datasources.main#"> 
SELECT Emp_Contact.name, Emp_Contact.lname, 
    Demographics.pin, Demographics.emp_id
FROM Demographics, Emp_Contact, Security, Link_Company_Emp_Contact
WHERE Demographics.emp_id = Emp_Contact.emp_id
	AND Emp_Contact.emp_id = Security.emp_id
	AND Emp_Contact.emp_id = Link_Company_Emp_Contact.emp_id
	AND Security.disable != 1
	AND Demographics.effective_to IS NULL
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND demographics.overtime = 1
ORDER BY Emp_Contact.lName, Emp_Contact.Name
</cfquery>
</cfsilent>
