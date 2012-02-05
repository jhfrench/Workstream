<!-- common_files/qry_get_terminal_nsm_levels.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_terminal_nsm_levels.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_terminal_nsm_levels" dbtype="query">
SELECT hierarchy_level_id, hierarchy_level_label
FROM get_business_function_hierarchy
WHERE required_ind=0
	OR hierarchy_level_id=#get_last_required_level.hierarchy_level_id#
</cfquery>