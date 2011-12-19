
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
	Revision 1.1  2006/09/15 22:25:37  csy
	<>

	Revision 1.0  2006-08-16 09:32:12-04  csy
	Initial revision

	Revision 1.0  2005-02-15 15:27:41-05  daugherty
	Initial revision

	Revision 1.2  2002-04-11 14:39:16-04  french
	Made change to also show second initial of employee.

	Revision 1.1  2001-10-11 10:55:30-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
 --->
<cfquery name="get_user_details" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS lname, left(Emp_Contact.name,2) AS f_init, Emp_Contact.name as name,
	Emp_Contact.emp_id AS emp_id, Company.company, ISNULL(REF_Companies.company,'NA') AS company_name,
	Security.username, Security.password, Security.groups, Security.disable, Email.email
FROM Emp_Contact, Company, REF_Companies, Security, Email
WHERE Emp_Contact.emp_id=Company.emp_id
	AND Company.company*=REF_Companies.company_id
	AND Emp_Contact.emp_id*=Email.emp_id
	AND Email.email_type_id = 1
	AND Emp_Contact.emp_id=Security.emp_id
	AND Emp_Contact.emp_id=<cfif isdefined("attributes.emp_id")>#attributes.emp_id#<cfelse>#session.user_account_id#</cfif>
ORDER BY Company.company, lname, f_init, email_type_id
</cfquery>
</cfsilent>

