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
SELECT #attributes.active_ind#, REPLACE(REPLACE(description, ' ', '_'), '/', '_')+'.#attributes.new_fuseaction#', #attributes.business_function_id#,
	#attributes.module_id#, '#attributes.check_variable#', '<cfif len(attributes.check_variable)>#attributes.relocate#</cfif>',
	#attributes.starting_point_ind#, '#attributes.body_onload#', #session.user_account_id#
FROM REF_Module
WHERE module_id=#attributes.module_id#
</cfquery>

<!--- get the id of the inserted record because it will be needed to populate Demographics table --->
<cfquery name="get_screen_id" datasource="#application.datasources.main#">
SELECT IDENT_CURRENT('REF_Screen') AS screen_id
</cfquery>
<cfset attributes.screen_id=get_screen_id.screen_id>