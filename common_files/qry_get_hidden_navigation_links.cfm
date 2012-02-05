<!-- common_files/qry_get_hidden_navigation_links.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_hidden_navigation_links.cfm">
	<responsibilities>
		I condense the results from get_user_access.cfm to only starting point business functions.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/15/2008" role="FuseCoder" comments="Created File">
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

<cfquery name="get_hidden_navigation_links" dbtype="query">
SELECT fuseaction, business_function_description
FROM get_user_access
WHERE starting_point_ind=1
GROUP BY fuseaction, business_function_description, module_sort_order, business_function_sort_order
ORDER BY module_sort_order, business_function_sort_order
</cfquery>