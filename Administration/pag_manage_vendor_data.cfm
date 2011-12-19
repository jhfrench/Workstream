<!-- Administration/pag_manage_vendor_data.cfm
	Author: Stephen Liu -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_vendor_data.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="csliu@nasa.gov" author="Stephen Liu" type="create" date="08/4/2009" role="FuseCoder" comments="Created File">
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

<cfif isdefined("attributes.parent_business_id")>	
	<cfmodule template="../common_files/qry_deactivate_business.cfm" parent_business_id="#attributes.parent_business_id#" preserve_latest_business_ind="0">
</cfif>

<cfinclude template="qry_get_vendor.cfm">
<cfinclude template="dsp_manage_vendor.cfm">
