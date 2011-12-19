<!-- Administration/qry_deactivate_ref_resource_link_type.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_resource_link_type.cfm">
	<responsibilities>
		Query to diactivate a record in REF_Resource_Link_Type table before a new insert.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="9/6/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_resource_link_type" datasource="#application.datasources.main#">
UPDATE REF_Resource_Link_Type
SET active_ind=0
WHERE active_ind=1
	AND resource_link_type_id=#attributes.resource_link_type_id#
</cfquery>