<!-- Administration/qry_get_ref_product_version.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_product_version.cfm">
	<responsibilities>
		Query to get product version.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="8/24/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.product_version_id" default="0">

<cfquery name="get_ref_product_version_count" datasource="#application.datasources.main#">
SELECT count(1) AS count1
FROM REF_Product_Version
WHERE active_ind=1
</cfquery>

<cfquery name="get_ref_product_version" datasource="#application.datasources.main#">
SELECT product_version_id, description, scheduled_release_date,
	sort_order
FROM REF_Product_Version
WHERE <cfif attributes.product_version_id NEQ 0>product_version_id=#attributes.product_version_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_product_version=get_ref_product_version>

<cfset caller.get_ref_product_version=get_ref_product_version>