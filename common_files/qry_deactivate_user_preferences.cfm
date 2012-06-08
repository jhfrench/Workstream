<!-- common_files/qry_deactivate_user_preferences.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_user_preferences.cfm">
	<responsibilities>
		I deactivate user preferences for a specific user.
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

<cfquery name="deactivate_user_preferences" datasource="#application.datasources.main#">
UPDATE User_Preferences
SET active_ind=0
WHERE active_ind=1
	AND user_account_id=#session.user_account_id#
</cfquery>