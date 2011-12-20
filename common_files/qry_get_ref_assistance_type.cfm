<!-- common_files/qry_get_ref_assistance_type.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_assistance_type.cfm">
	<responsibilities>
		I retrieve REF_State records.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/1/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.assistance_type_id" default="0">
<cfquery name="get_ref_assistance_type" datasource="#application.datasources.main#">
SELECT assistance_type_id, description,
	sort_order
FROM REF_assistance_type
WHERE <cfif attributes.assistance_type_id NEQ 0>assistance_type_id IN (#attributes.assistance_type_id#)<cfelseif len(attributes.code)>code IN (#preservesinglequotes(attributes.code)#)<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_assistance_type=get_ref_assistance_type>