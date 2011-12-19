
<!--Directory/qry_get_phone_types.cfm
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
 --->
<cfquery name="get_phone_types" datasource="#application.datasources.main#">
SELECT phone_type_id, phone_type
FROM REF_Phone_Type
</cfquery>
</cfsilent>

