
<!-- Directory/act_update_locations.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the locations table.

	||
	Edits: 
	$Log$
	Revision 1.1  2006/07/17 07:14:15  french
	Modified code to ensure that employee updates don't cause duplicate demographic records.

	||
	Variables:

	END FUSEDOC --->
<cfquery name="location_delete" datasource="#application.datasources.main#">
DELETE FROM Location
WHERE emp_id=#attributes.emp_id#
</cfquery> 
<cfloop query="get_locations">
	<cfif len(evaluate("attributes.address1_#location_type_id#"))>
		<cfset loc_1 = evaluate("attributes.address1_#location_type_id#")>
		<cfset loc_2 = "#evaluate("attributes.address2_#location_type_id#")#">
		<cfset city = "#evaluate("attributes.city_#location_type_id#")#">
		<cfset state = evaluate("attributes.state_#location_type_id#")>
		<cfset zip = "#evaluate("attributes.zip_#location_type_id#")#">
		<cfquery name="location_entry" datasource="#application.datasources.main#">
		INSERT INTO Location(emp_id, address1<cfif len(evaluate("attributes.address2_#location_type_id#"))>, address2</cfif>, 
			city, state, zip, 
			location_type_id)
		VALUES(#attributes.emp_id#,'#loc_1#'<cfif len(evaluate("attributes.address2_#location_type_id#"))>,'#loc_2#'</cfif>,
			'#city#','#state#','#zip#',
			#location_type_id#)
		</cfquery>
	</cfif>
</cfloop>
</cfsilent>
