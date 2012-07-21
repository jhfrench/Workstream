
<!--Directory/qry_get_emp_details.cfm
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
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	<-- lname: string containing the last name of an employee
	<-- fname: string containing the first name of an employee
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_emp_details" datasource="#application.datasources.main#">
SELECT Emp_Contact.name AS fname, Emp_Contact.lname AS lname, Demographics.ssn AS ssn,
	Demographics.dob, Demographics.hire_date, COALESCE(Demographics.photo,'nopic.jpg') AS photo,
	Demographics.end_date, COALESCE(Emp_Contact.credentials,'') AS credentials, Emp_Biography.biography
FROM Emp_Contact
	INNER JOIN Demographics_Ngauge AS Demographics ON Emp_Contact.emp_id=Demographics.emp_id
	LEFT OUTER JOIN Emp_Biography ON Emp_Contact.emp_id=Emp_Biography.emp_id
WHERE Demographics.effective_to IS NULL<cfif isdefined("attributes.emp_id") and len(attributes.emp_id)>
	AND Demographics.emp_id=#attributes.emp_id#</cfif>
</cfquery>