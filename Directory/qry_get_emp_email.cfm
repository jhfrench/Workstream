
<!--Directory/qry_get_emp_email.cfm
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
	Revision 1.0  2005/02/15 20:47:06  daugherty
	Initial revision

	Revision 1.1  2001-10-11 12:20:48-04  long
	Added FuseDoc

	||
	Variables:
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	<-- company: string containing the name of any company the employee is associated with
 --->
<cfquery name="get_emp_email" datasource="#application.datasources.main#">
SELECT REF_Email_Type.email_type, Email.email
FROM Email, REF_Email_Type
WHERE Email.email_type_id=REF_Email_Type.email_type_id
	AND Email.emp_id=#attributes.emp_id#
ORDER BY REF_Email_Type.email_type DESC
</cfquery>
</cfsilent>

