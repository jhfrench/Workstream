<!-- Administration/qry_update_application_name.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_update_application_name.cfm">
	<responsibilities>
		I update installation.
	</responsibilities>
	<properties>
		<history email="jeromy.french@nasa.gov" author="Jeromy French" type="create" date="5/31/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="update_application_name" datasource="#application.datasources.main#">
UPDATE Installation
SET application_name='yo'
WHERE installation_id=#application.installation_id#
</cfquery>