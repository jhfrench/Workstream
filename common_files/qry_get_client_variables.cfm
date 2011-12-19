
<!--common_files/qry_get_client_variables.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I establish the company that the user works for, and send them to the appropriate page for their company
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="get_client_variables" datasource="#application.datasources.main#">
SELECT Demographics.pin, Emp_Contact.emp_id, REF_Companies.company, 
	Demographics.manager_non_id AS [level]
FROM Emp_Contact, Demographics, Company, Security, REF_Companies
WHERE Emp_Contact.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Company.emp_id
	AND Emp_Contact.emp_id=Security.emp_id
	AND Company.Company=REF_Companies.Company_ID
	AND Security.Disable!=1
	AND NT_User_Name='#cgi.remote_user#'
	AND Demographics.effective_to IS NULL
</cfquery>
</cfsilent>