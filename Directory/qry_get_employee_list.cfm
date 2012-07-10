
<!--Directory/qry_get_employee_list.cfm
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
	--> session.workstream_selected_company_id: id of the companies that the employee wishes to see
	<-- company: id that identifies the user's company
	<-- email: string containing the email address of an employee
	<-- emp_id: id that identifies user to workstream
	<-- extension: string containing the extension of an employee
	<-- lname: string containing the last name of an employee
	<-- name: string containing the first name of an employee
	<-- phone_number: string containing the work phone number of an employee
 --->
<cfquery name="get_employee_list" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT (Emp_Contact.lname + ', ' + Emp_Contact.name) AS name,
	Emp_Contact.emp_id AS emp_id, REF_Company.description AS company,
	COALESCE(Email.email,'NA') AS email, COALESCE(Phone.phone_number,'NA') AS phone_number,
	COALESCE(Phone.extension,'NA') AS extension, Position_History.Position_ID
FROM Emp_Contact, Link_Company_Emp_Contact, REF_Company,
	Security, Email, Phone,
	Position_History, Demographics_Ngauge AS Demographics
WHERE Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	AND Emp_Contact.emp_id=Security.emp_id
	AND Emp_Contact.emp_id*=Email.emp_id
	AND Emp_Contact.emp_id*=Phone.emp_id
	AND Link_Company_Emp_Contact.company_id=REF_Company.company_id
	AND Emp_Contact.emp_id = Position_History.emp_id
	AND Demographics.emp_id = Emp_Contact.emp_id
	AND Email.email_type_id = 1
	AND Phone.phone_type_id = 1
	AND Security.disable=0
	AND Position_History.effective_end_date IS NULL
	AND Demographics.end_date IS NULL
	AND Demographics.Effective_To IS NULL
	AND Link_Company_Emp_Contact.company_id IN (<cfif listlen(session.workstream_selected_company_id)>#session.workstream_selected_company_id#<cfelse>0</cfif>)
	AND #application.team_changed#=#application.team_changed#
	AND 1=1
ORDER BY Link_Company_Emp_Contact.company_id, Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>
