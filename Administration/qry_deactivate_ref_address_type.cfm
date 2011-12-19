<!-- Administration/qry_deactivate_ref_priority.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_address_type.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Priority table before a new insert.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_address_type" datasource="#application.datasources.main#">
UPDATE REF_address_type
SET active_ind=0
WHERE active_ind=1
	AND address_type_id=#attributes.address_type_id#
</cfquery>
