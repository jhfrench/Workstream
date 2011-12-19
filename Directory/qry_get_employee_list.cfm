
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
	Revision 1.1  2006/01/10 21:58:50  stetzer
	Adding position number requirement to show up on employee list

	Revision 1.0  2005-02-15 15:47:02-05  daugherty
	Initial revision

	Revision 1.1  2001-10-11 12:17:59-04  long
	Added FuseDoc

	||
	Variables:
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
	--> session.workstream_company_select_list: id of the companies that the employee wishes to see
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
	Emp_Contact.emp_id AS emp_id, REF_Companies.company AS company,
	ISNULL(Email.email,'NA') AS email, ISNULL(Phone.phone_number,'NA') AS phone_number,
	ISNULL(Phone.extension,'NA') AS extension, Position_History.Position_ID
FROM Emp_Contact, Company, REF_Companies, Security, Email, Phone

, Position_History, Demographics 


WHERE Emp_Contact.emp_id=Company.emp_id
	AND Emp_Contact.emp_id=Security.emp_id
	AND Emp_Contact.emp_id*=Email.emp_id
	AND Emp_Contact.emp_id*=Phone.emp_id
	AND Company.company=REF_Companies.company_id
	AND Email.email_type_id = 1
	AND Phone.phone_type_id = 1
	AND Security.disable=0

	AND Emp_Contact.Emp_ID = Position_History.Emp_ID
	AND Position_History.Effective_EndDate is null

	AND Demographics.Emp_ID = Emp_Contact.Emp_ID
	AND Demographics.End_Date is null
	AND Demographics.Effective_To is null
	
	
	
	
	
	
	AND Company.company IN (<cfif listlen(session.workstream_company_select_list)>#session.workstream_company_select_list#<cfelse>0</cfif>)
	AND #application.team_changed#=#application.team_changed#
ORDER BY Company.company, Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>
