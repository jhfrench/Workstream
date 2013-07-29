<!-- Administration/qry_insert_ref_screen.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_screen.cfm">
	<responsibilities>
		Query to insert a new screen into REF_Screen table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_screen" datasource="#application.datasources.main#">
INSERT INTO REF_Screen (active_ind, fuseaction, business_function_id,
	module_id, check_variable, relocate,
	starting_point_ind, body_onload, created_by)
SELECT <cfqueryparam value="#attributes.active_ind#" cfsqltype="cf_sql_integer" />, REPLACE(REPLACE(description, ' ', '_'), '/', '_') || '.#attributes.new_fuseaction#', <cfqueryparam value="#attributes.business_function_id#" cfsqltype="cf_sql_integer" />,
	<cfqueryparam value="#attributes.module_id#" cfsqltype="cf_sql_integer" />, '#attributes.check_variable#', '<cfif len(attributes.check_variable)>#attributes.relocate#</cfif>',
	<cfqueryparam value="#attributes.starting_point_ind#" cfsqltype="cf_sql_integer" />, '#attributes.body_onload#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
FROM REF_Module
WHERE module_id=<cfqueryparam value="#attributes.module_id#" cfsqltype="cf_sql_integer" />
RETURNING screen_id
</cfquery>
<!--- get the id of the inserted record because it will be needed to populate Demographics table --->
<cfset attributes.screen_id=insert_ref_screen.screen_id>