<!-- common_files/qry_gt_ref_state.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_state.cfm">
	<responsibilities>
		I retrieve REF_Country records.
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
<cfparam name="attributes.country_id" default="0">
<cfquery name="get_ref_country" datasource="#application.datasources.main#">
SELECT country_id, description, code,
	sort_order
FROM REF_Country
WHERE <cfif attributes.country_id NEQ 0>country_id=#attributes.country_id#<cfelseif len(attributes.code)>code IN (#preservesinglequotes(attributes.code)#)<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_country=get_ref_country>