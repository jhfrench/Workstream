
<!--Directory/qry_get_contact_emails.cfm
	Author: Victor B -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all the email types that workstream tracks.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> application.datasources.main: datasource for the application
	--> variables.user_account_id: contains the unique identifier of this employee
	<-- email_type_id: string containing email Type ID for a person
	<-- Email_Type: string containing email Type for a person 
	<-- Email: string containing email for a person
	<-- Email_ID: string containing email ID for a person
 --->
</cfsilent>

<cfquery name="get_contact_emails" datasource="#application.datasources.main#">
SELECT REF_Email_Type.Email_Type, Email.Email, 
	REF_Email_Type.email_type_id, Email.Email_ID
FROM REF_Email_Type
	LEFT OUTER JOIN Email ON REF_Email_Type.email_type_id=Email.email_type_id
		AND Email.active_ind=1
		AND Email.user_account_id=#variables.user_account_id#
</cfquery>
