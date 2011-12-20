<!-- common_files/qry_insert_user_preferences.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_user_preferences.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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
VALUES (#session.user_account_id#, #attributes.program_year_id#, '#attributes.text_size#',
	#attributes.numeric_multiplier_id#, #session.user_account_id#)
</cfquery>