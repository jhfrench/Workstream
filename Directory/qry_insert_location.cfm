
<!--Directory/qry_insert_location.cfm
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
	||
	Variables:
 --->
<cfloop query="get_locations">
	<cfset variables.address1=evaluate("attributes.address1_#location_type_id#")>
<cfif len(variables.address1)>
<cfscript>
	variables.address2=evaluate("attributes.address2_#location_type_id#");
	variables.city=evaluate("attributes.city_#location_type_id#");
	variables.state=evaluate("attributes.state_#location_type_id#");
	variables.zip=evaluate("attributes.zip_#location_type_id#");
</cfscript>
<cfquery name="insert_location" datasource="#application.datasources.main#">
INSERT INTO Location(user_account_id, address1, address2,
	city, state, zip,
	location_type_id, created_by)
VALUES(#variables.user_account_id#, '#variables.address1#', <cfif len(variables.address2)>'#variables.address2#'<cfelse>NULL</cfif>,
	'#variables.city#', '#variables.state#', '#variables.zip#',
	#location_type_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfquery>
</cfif>
</cfloop>
</cfsilent>
