
<!--Admin/qry_get_user_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="get_user_details" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS lname, left(Emp_Contact.name,2) AS f_init, Emp_Contact.name as name,
	Emp_Contact.emp_id AS emp_id, Link_Emp_Contact_Employer.company_id, ISNULL(REF_Company.description,'NA') AS company_name,
	Security.username, Security.password, Security.groups, Security.disable, Email.email
FROM Emp_Contact, Link_Emp_Contact_Employer, REF_Company, Security, Email
WHERE Emp_Contact.emp_id=Link_Emp_Contact_Employer.emp_id
	AND Link_Emp_Contact_Employer.company_id*=REF_Company.company_id
	AND Emp_Contact.emp_id*=Email.emp_id
	AND Email.email_type_id = 1
	AND Emp_Contact.emp_id=Security.emp_id
	AND Emp_Contact.emp_id=<cfif isdefined("attributes.emp_id")>#attributes.emp_id#<cfelse>#session.user_account_id#</cfif>
ORDER BY Link_Emp_Contact_Employer.company_id, lname, f_init, email_type_id
</cfquery>
</cfsilent>

