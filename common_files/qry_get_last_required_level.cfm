<!-- common_files/qry_get_last_required_level.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_last_required_level.cfm">
	<responsibilities>
		I retrieve last required level from get_business_function_hierarchy table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/2/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_last_required_level" maxrows="1" dbtype="query">
SELECT hierarchy_level_id, l_p_y_h_id, hierarchy_level_label
FROM get_business_function_hierarchy
WHERE required_ind=1
ORDER BY hierarchy_level_id DESC
</cfquery>
