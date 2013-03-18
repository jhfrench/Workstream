
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
	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested
	<-- company: string containing the name of any company the employee is associated with
 --->
<cfquery name="get_emp_email" datasource="#application.datasources.main#">
SELECT REF_Email_Type.email_type, Email.email
FROM Email
	INNER JOIN REF_Email_Type ON Email.email_type_id=REF_Email_Type.email_type_id
WHERE Email.active_ind=1
	AND Email.user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
ORDER BY REF_Email_Type.email_type
</cfquery>
</cfsilent>