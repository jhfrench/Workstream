<!-- Administration/qry_deactivate_ref_product_version.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_product_version.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Product_Version table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/24/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_product_version" datasource="#application.datasources.main#">
UPDATE REF_Product_Version
SET active_ind=0
WHERE active_ind=1
	AND product_version_id=#attributes.product_version_id#
</cfquery>
