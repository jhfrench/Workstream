
<!--common_files/qry_employee_name.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the name of the specified employee (apss the user_account_id into the module).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="employee_name" datasource="#application.datasources.main#">
SELECT Emp_Contact.name || '  ' || Emp_Contact.lname AS employee_name
FROM Emp_Contact
WHERE Emp_Contact.user_account_id=#attributes.user_account_id#
</cfquery>
<cfset request.employee_name=employee_name.employee_name>
</cfsilent>

