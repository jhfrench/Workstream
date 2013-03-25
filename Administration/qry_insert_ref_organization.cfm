<!-- Administration/qry_insert_ref_organization.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_organization.cfm">
	<responsibilities>
		Query to insert new organization into REF_Organization table and get its ID.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/5/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfquery name="insert_ref_organization" datasource="#application.datasources.main#">
INSERT INTO REF_Organization (description, organization_code, abbreviation,
	created_by, sort_order, active_ind)
VALUES ('#attributes.description#', COALESCE('#attributes.organization_code#','#attributes.description#'), COALESCE('#attributes.abbreviation#','#attributes.description#'),
	<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />, #attributes.sort_order#, #attributes.active_ind#)
</cfquery>

<cfquery name="get_ref_organization_id" datasource="#application.datasources.main#">
SELECT CURRVAL('REF_Organization_organization_id_SEQ') AS organization_id
</cfquery>
<cfset attributes.organization_id=get_ref_organization_id.organization_id>