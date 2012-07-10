<!-- common_files/qry_get_ref_state_province.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_state_province.cfm">
	<responsibilities>
		I retrieve REF_State records.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/1/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.state_province_id" default="0">
<cfquery name="get_ref_state_province" datasource="#application.datasources.main#">
SELECT state_province_id, description, code,
	COALESCE(faad_code,'') AS faad_code, COALESCE(faad_code,'?')|| ' (' || LEFT(description,10)||')'  AS faad_display, sort_order
FROM REF_State_Province
WHERE <cfif attributes.state_province_id NEQ 0>state_province_id IN (#attributes.state_province_id#)<cfelseif len(attributes.code)>code IN (#preservesinglequotes(attributes.code)#)<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_state_province=get_ref_state_province>