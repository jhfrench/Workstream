
<!--Directory/qry_get_contact_phones.cfm
	Author: Victor B -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all the phone types that workstream tracks.
	||
	Name: Victor Blell
	||
	Edits: 
	$Log$
	||
	Variables:
	--> application.datasources.main: datasource for the application
	--> variables.emp_id: contains the unique identifier of this employee
	<--  Phone_Type_ID: string containing Phone Type ID for a person
    <--  Phone_Type: string containing Phone Type for a person 
	<--  Phone_Number: string containing Phone Number for a person
    <--  Extension: string containing Phone Extension for a person
	<--  Phone_id: string containing Phone ID for a person
 --->
<cfquery name="get_contact_phones" datasource="#application.datasources.main#">
SELECT REF_Phone_Type.Phone_Type_ID, REF_Phone_Type.Phone_Type, Phone.Phone_Number, 
    Phone.Extension, Phone.Phone_id
FROM REF_Phone_Type
	LEFT OUTER JOIN Phone ON REF_Phone_Type.Phone_Type_ID = Phone.Phone_type_id 
		AND Phone.emp_id = #variables.emp_id#
</cfquery>
</cfsilent>

