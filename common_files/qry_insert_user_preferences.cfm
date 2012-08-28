<!-- common_files/qry_insert_user_preferences.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_user_preferences.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_user_preferences" datasource="#application.datasources.main#">
INSERT INTO User_Preferences (user_account_id, program_year_id, text_size,
	numeric_multiplier_id, created_by)
VALUES (#variables.user_identification#, #attributes.program_year_id#, '#attributes.text_size#',
	#attributes.numeric_multiplier_id#, #variables.user_identification#)
</cfquery>
