
<!--Directory/qry_get_locations.cfm
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
<cfquery name="get_locations" datasource="#application.datasources.main#">
SELECT location_type_id, location_type
FROM REF_Location_Type
</cfquery>
</cfsilent>

