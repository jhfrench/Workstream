<!-- Application_Manager/main/qry_insert_installation_url.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_installation_url.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the Installation_URL table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_installation_url" datasource="#application.datasources.application_manager#">
INSERT INTO Installation_URL (installation_id, url_to_base, created_date,
	active_ind)
SELECT #attributes.installation_id#, '#attributes.url_to_base#', CURRENT_TIMESTAMP,
	1
FROM Dual
</cfquery>