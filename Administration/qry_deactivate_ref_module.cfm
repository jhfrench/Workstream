<!-- Administration/qry_deactivate_ref_module.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_module.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Module table before a new insert.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_module" datasource="#application.datasources.main#">
UPDATE REF_Module
SET active_ind=0
WHERE active_ind=1
	AND module_id=#attributes.module_id#
</cfquery>
