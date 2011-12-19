<!--Directory/qry_get_contact_locations.cfm
	Author: Victor B-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employee locations
	||
	Name: Victor Blell
	||
	Edits: 
	$Log$
	||
	Variables:

	--> variables.emp_id: number containing the unique identifier of the individual being requested
	<-- address1: string containing the first address line for a person
	<-- address2: string containing the second address line for a person
	<-- Location_Type: string containing the Location type for a person
	<-- City: string containing the City for a person
	<-- State: string containing the State for a person 
	<-- Zip: string containing the Zip for a person
	<-- location_ID: string containing the Locatio ID for a person
	<-- Location_Type_ID: string containing Location Type ID for a person
 --->
	<cfquery name="get_contact_locations" datasource="#application.datasources.main#">
	SELECT Rlt.Location_Type, Lt.Address1, 
	    Lt.Address2, Lt.City, Lt.State, Lt.Zip, 
	    Lt.location_ID, 
	    Rlt.Location_Type_ID
	FROM Location lt RIGHT OUTER JOIN
	    REF_Location_Type Rlt ON 
	    Lt.Location_Type_Id = Rlt.Location_Type_ID
			AND
		Lt.emp_id =#variables.emp_id#
	</cfquery>
</cfsilent>