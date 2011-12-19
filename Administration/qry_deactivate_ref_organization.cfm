<!-- Administration/qry_deactivate_ref_organization.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_organization.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Organization table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_organization" datasource="#application.datasources.main#">
UPDATE REF_Organization
SET active_ind=0
WHERE active_ind=1
	AND organization_id=#attributes.organization_id#
</cfquery>