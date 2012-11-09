
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
	<cfquery name="get_contact_emails" datasource="#application.datasources.main#">
		SELECT Ret.Email_Type, Em.Email, 
			Ret.email_type_id, Em.Email_ID
		FROM Email Em
			RIGHT OUTER JOIN REF_Email_Type Ret ON  Em.email_type_id = Ret.email_type_id 
				AND Em.user_account_id=#variables.user_account_id#
	</cfquery>
</cfsilent>

