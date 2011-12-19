
<!--Directory/qry_get_email_types.cfm
	Author: Jeromy F -->
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
 --->
<cfquery name="get_email_types" datasource="#application.datasources.main#">
SELECT email_type_id, email_type
FROM REF_Email_Type
</cfquery>
</cfsilent>

