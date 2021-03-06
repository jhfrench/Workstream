<!-- common_files/qry_get_workstream_levels.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_workstream_levels.cfm">
	<responsibilities>
		I get NSM level structure.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/2/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.show_required_only_ind" default="1">
<cfquery name="get_workstream_levels" dbtype="query">
SELECT hierarchy_level_id, hierarchy_level_label, l_p_y_h_id, required_ind
FROM get_business_function_hierarchy<cfif attributes.show_required_only_ind>
WHERE required_ind=1</cfif><cfif attributes.parent_privilege_inheritance_ind>
ORDER BY get_business_function_hierarchy.sort_order DESC</cfif>
</cfquery>
<cfset caller.get_workstream_levels=get_workstream_levels>