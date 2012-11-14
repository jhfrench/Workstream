<!--Directory/qry_get_contact_locations.cfm
	Author: Victor B-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employee locations
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:

	--> variables.user_account_id: number containing the unique identifier of the individual being requested
	<-- address1: string containing the first address line for a person
	<-- address2: string containing the second address line for a person
	<-- Location_Type: string containing the Location type for a person
	<-- City: string containing the City for a person
	<-- State: string containing the State for a person 
	<-- Zip: string containing the Zip for a person
	<-- location_ID: string containing the Locatio ID for a person
	<-- location_type_id: string containing Location Type ID for a person
 --->
</cfsilent>
<cfquery name="get_contact_locations" datasource="#application.datasources.main#">
SELECT REF_Location_Type.location_type_id, REF_Location_Type.location_type, Location.location_id,
	Location.Address1, Location.Address2, Location.city,
	Location.state, Location.zip
FROM REF_Location_Type
	LEFT OUTER JOIN Location ON REF_Location_Type.location_type_id=Location.location_type_id
		AND Location.active_ind=1
		AND Location.user_account_id=#variables.user_account_id#
</cfquery>