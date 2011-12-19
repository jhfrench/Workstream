
<!--Directory/qry_location_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a demographics record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:47:14  daugherty
	Initial revision

	Revision 1.0  2001-10-16 17:05:54-04  french
	Initial revision

	||
	Variables:
 --->
<cfloop query="get_locations">
<cfif len(evaluate("attributes.address1_#location_type_id#"))>
<cfquery name="location_entry" datasource="#application.datasources.main#">
INSERT INTO Location(emp_id, address1<cfif len(evaluate("attributes.address2_#location_type_id#"))>, address2</cfif>, city, state, zip, location_type_id)
VALUES(#variables.emp_id#,'#evaluate("attributes.address1_#location_type_id#")#'<cfif len(evaluate("attributes.address2_#location_type_id#"))>,'#evaluate("attributes.address2_#location_type_id#")#'</cfif>,'#evaluate("attributes.city_#location_type_id#")#','#evaluate("attributes.state_#location_type_id#")#','#evaluate("attributes.zip_#location_type_id#")#',#location_type_id#)
</cfquery>
</cfif>
</cfloop>
</cfsilent>

