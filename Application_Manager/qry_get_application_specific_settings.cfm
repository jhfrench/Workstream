<!-- Application_Manager/qry_get_application_specific_settings.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_application_specific_settings.cfm" Specification="2.0">
	<responsibilities>
		I retrieve settings for a given installation from the Custom_Setting table. The settings are stored in a denormalized fashion in the DB so that the values can be converted to ColdFusion application-scoped variables more efficiently.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_application_specific_settings" cachedafter="02/02/1978" datasource="#application.datasources.application_manager#">
SELECT setting_name, setting_value
FROM Custom_Setting
WHERE active_ind=1
	AND #variables.application_last_updated#=#variables.application_last_updated# <!--- date comes from Last_Updated.last_updated in Application_Manager --->
	AND installation_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#application.installation_id#">
ORDER BY setting_name
</cfquery>