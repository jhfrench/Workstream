<!-- common_files/qry_get_module_sub_navigation.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_module_sub_navigation.cfm">
	<responsibilities>
		I retrieve module sub navigation for a specified user and a specified year.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_module_sub_navigation" dbtype="query">
SELECT module_id, module_description, parent_business_function_id,
	parent_business_function, business_function_id, business_function_description,
	child_count, leaf_ind, hiearchy_level,
	fuseaction
FROM get_user_access
WHERE starting_point_ind=1
GROUP BY module_id, module_description, parent_business_function_id,
	parent_business_function, business_function_id, business_function_description,
	child_count, leaf_ind, hiearchy_level,
	fuseaction
ORDER BY module_sort_order, module_id, business_function_sort_order,
	business_function_id













</cfquery>
<cfset caller.get_module_sub_navigation=get_module_sub_navigation>