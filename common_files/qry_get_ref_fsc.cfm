<!-- common_files/qry_gt_ref_fsc.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_fsc.cfm">
	<responsibilities>
		I display the form for editing fsc and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="PLiang@nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.fsc_id" default="0">
<cfquery name="get_ref_fsc" datasource="#application.datasources.main#">
SELECT fsc_id, description, code,
	sort_order, rpad(code, 6, chr(32)) || '-' || SUBSTRING(description, 1, 60) as code_description
FROM REF_FSC
WHERE <cfif attributes.fsc_id NEQ 0>fsc_id=#attributes.fsc_id#<cfelseif len(attributes.code)>code IN (#preservesinglequotes(attributes.code)#)<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_fsc=get_ref_fsc>