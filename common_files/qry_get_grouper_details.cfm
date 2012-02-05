<!-- common_files/qry_get_grouper_details.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_grouper_details.cfm">
	<responsibilities>
		I get the meta-data that describes the different groupers that make up the NSM structure for the specified program year.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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


<cfquery name="get_grouper_details" datasource="#application.datasources.main#">
SELECT grouper_detail_id, grouper_label, grouper_table_name,
	sort_order, program_year_id, phasing_plan_top_level_ind,
	phasing_plan_terminal_ind
FROM REF_Grouper_Detail
WHERE active_ind=1
	AND program_year_id=#attributes.program_year_id#<cfif isdefined("attributes.nsm_hierarchy_level")>
	AND sort_order=#attributes.nsm_hierarchy_level#</cfif>
ORDER BY sort_order
</cfquery>