
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
	--> application.team_changed: date of the last time Employee or Demographics tables were changed
	--> session.workstream_selected_company_id: id of the companies that the employee wishes to see
	<-- company: id that identifies the user's company
	<-- email: string containing the email address of an employee
	<-- user_account_id: id that identifies user to workstream
	<-- extension: string containing the extension of an employee
	<-- lname: string containing the last name of an employee
	<-- name: string containing the first name of an employee
	<-- phone_number: string containing the work phone number of an employee
 --->
<cfquery name="get_employee_list" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT (Emp_Contact.lname || ', ' || Emp_Contact.name) AS name,
	Emp_Contact.user_account_id, REF_Company.description AS company,
	COALESCE(Email.email,'NA') AS email, COALESCE(Phone.phone_number,'NA') AS phone_number,
	COALESCE(Phone.extension,'NA') AS extension, Position_History.position_id
FROM Emp_Contact
	INNER JOIN Link_Company_User_Account ON Emp_Contact.user_account_id=Link_Company_User_Account.user_account_id
	INNER JOIN REF_Company ON Link_Company_User_Account.company_id=REF_Company.company_id
	INNER JOIN Position_History ON Emp_Contact.user_account_id=Position_History.user_account_id
	INNER JOIN View_Demographics_Workstream AS Demographics ON Emp_Contact.user_account_id=Demographics.user_account_id
	LEFT OUTER JOIN Email ON Emp_Contact.user_account_id=Email.user_account_id
		AND Email.email_type_id=1
	LEFT OUTER JOIN Phone ON Emp_Contact.user_account_id=Phone.user_account_id
		AND Phone.phone_type_id=1
WHERE #application.team_changed#=#application.team_changed#
	AND Link_Company_User_Account.company_id IN (<cfif listlen(session.workstream_selected_company_id)>#session.workstream_selected_company_id#<cfelse>0</cfif>)
	AND Position_History.effective_end_date IS NULL
	AND Demographics.effective_to IS NULL
ORDER BY Link_Company_User_Account.company_id, Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>
