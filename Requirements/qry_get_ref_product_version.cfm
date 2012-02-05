<!-- Requirements/qry_get_ref_product_version.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_product_version.cfm">
	<responsibilities>
		I retrieve data from REF_Product_Version table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/23/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.product_version_id" default="">
<cfquery name="get_ref_product_version" datasource="#application.datasources.main#">
SELECT product_version_id, description, selectable_ind,
	scheduled_release_date
FROM REF_Product_Version
WHERE active_ind=1
	AND (selectable_ind=1<cfif len(attributes.product_version_id)>
		OR product_version_id=#attributes.product_version_id# /*only show old product versions for requirements that are already assigned to them*/</cfif>)
ORDER BY product_version_id
</cfquery>
<cfset caller.get_ref_product_version=get_ref_product_version>