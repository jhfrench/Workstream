
<!--Directory/qry_get_employee_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested
	<-- lname: string containing the last name of an employee
	<-- fname: string containing the first name of an employee
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_employee_details" datasource="#application.datasources.main#">
SELECT Emp_Contact.name AS fname, Emp_Contact.lname, Demographics.ssn AS ssn,
	Demographics.dob, Demographics.hire_date, COALESCE(Demographics.photo,'nopic.jpg') AS photo,
	Demographics.effective_to, COALESCE(Emp_Contact.credentials,'') AS credentials, Emp_Biography.biography
FROM Emp_Contact
	INNER JOIN View_Demographics_Workstream AS Demographics ON Emp_Contact.user_account_id=Demographics.user_account_id
	LEFT OUTER JOIN Emp_Biography ON Emp_Contact.user_account_id=Emp_Biography.user_account_id
WHERE Demographics.effective_to IS NULL<cfif isdefined("attributes.user_account_id") and len(attributes.user_account_id)>
	AND Demographics.user_account_id=#attributes.user_account_id#</cfif>
</cfquery>