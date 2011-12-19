
<!--Directory/qry_get_contact_emails.cfm
	Author: Victor B -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all the email types that workstream tracks.
	||
	Name: Victor Blell
	||
	Edits: 
	$Log$
	||
	Variables:
	--> application.datasources.main: datasource for the application
	--> variables.emp_id: contains the unique identifier of this employee
	<--  Email_Type_ID: string containing email Type ID for a person
    <--  Email_Type: string containing email Type for a person 
	<--  Email: string containing email for a person
	<--  Email_ID: string containing email ID for a person
 --->
	<cfquery name="get_contact_emails" datasource="#application.datasources.main#">
		SELECT Ret.Email_Type, Em.Email, 
	  	  	Ret.Email_Type_ID, Em.Email_ID
		FROM Email Em RIGHT OUTER JOIN
	   		REF_Email_Type Ret ON 
	  	  	Em.Email_Type_ID = Ret.Email_Type_ID 
				AND 
	   	 	Em.Emp_ID = #variables.emp_id#
	</cfquery>
</cfsilent>

