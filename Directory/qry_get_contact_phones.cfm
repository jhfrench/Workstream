
<!--Directory/qry_get_contact_phones.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all the phone types that workstream tracks.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> application.datasources.main: datasource for the application
	--> variables.user_account_id: contains the unique identifier of this employee
	<-- phone_type_id: string containing Phone Type ID for a person
	<-- Phone_Type: string containing Phone Type for a person 
	<-- Phone_Number: string containing Phone Number for a person
	<-- Extension: string containing Phone Extension for a person
	<-- Phone_id: string containing Phone ID for a person
 --->
<cfquery name="get_contact_phones" datasource="#application.datasources.main#">
SELECT REF_Phone_Type.phone_type_id, REF_Phone_Type.Phone_Type, Phone.Phone_Number, 
    Phone.Extension, Phone.Phone_id
FROM REF_Phone_Type
	LEFT OUTER JOIN Phone ON REF_Phone_Type.phone_type_id=Phone.phone_type_id 
		AND Phone.active_ind=1
		AND Phone.user_account_id=<cfqueryparam value="#variables.user_account_id#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>
