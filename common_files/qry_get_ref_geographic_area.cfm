<!-- common_files/qry_get_ref_geographic_area.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_geographic_area.cfm">
	<responsibilities>
		I retrieve REF_Geographic_Area records.
	</responsibilities>
	<properties>
		<history email="csliu@nasa.gov" author="Stephen Liu" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.code" default="">
<cfparam name="attributes.geographic_area_id" default="0">
<cfquery name="get_ref_geographic_area" datasource="#application.datasources.main#">
SELECT geographic_area_id, description, code,
	sort_order
FROM REF_Geographic_Area
WHERE <cfif attributes.geographic_area_id NEQ 0>geographic_area_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.geographic_area_id#"><cfelseif len(attributes.code)>code IN (#preservesinglequotes(attributes.code)#)<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_geographic_area=get_ref_geographic_area>