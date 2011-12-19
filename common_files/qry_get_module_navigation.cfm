<!-- common_files/qry_get_module_navigation.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_module_navigation.cfm">
	<responsibilities>
	</responsibilities>
		I get module navigation for a specified user and a specified program year.
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_module_navigation" dbtype="query">
SELECT module_id, module_description, locked_ind
FROM get_user_access
GROUP BY module_id, module_description, locked_ind
ORDER BY module_sort_order
</cfquery>