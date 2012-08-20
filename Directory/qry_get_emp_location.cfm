
<!--Directory/qry_get_emp_location.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	<-- address1: string containing the first address line for a person
	<-- address2: string containing the second address line for a person
 --->
<cfquery name="get_emp_location" datasource="#application.datasources.main#">
SELECT REF_Location_Type.location_type, Location.address1, Location.address2,
	Location.city, Location.state, Location.zip
FROM Location, REF_Location_Type
WHERE Location.location_type_id = REF_Location_Type.location_type_id
	AND Location.emp_id=#attributes.emp_id#
ORDER BY location_type DESC
</cfquery>
</cfsilent>
