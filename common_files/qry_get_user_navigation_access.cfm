<!-- common_files/qry_get_user_navigation_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_navigation_access.cfm">
	<responsibilities>
		I get the system access for a specific user.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_user_navigation_access" datasource="#application.datasources.main#">
SELECT REF_Module.module_id, REF_Module.description AS module_description, REF_Business_Function.business_function_id,
	REF_Business_Function.description AS business_function_description, REF_Business_Function.default_access_ind,
	CASE WHEN Access_User_Business_Function.business_function_id IS NOT NULL THEN ' CHECKED' ELSE '' END AS checked_ind,
	CASE WHEN Access_User_Business_Function.business_function_id IS NOT NULL THEN REF_Business_Function.business_function_id ELSE 0 END AS old_business_function_id
FROM REF_Module
	INNER JOIN REF_Screen ON REF_Module.module_id=REF_Screen.module_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	LEFT OUTER JOIN (
		/*Get the cumulative access for all the users the administrator is looking at*/
		SELECT Access_User_Business_Function.business_function_id
		FROM Access_User_Business_Function
		WHERE Access_User_Business_Function.active_ind=1
			AND Access_User_Business_Function.program_year_id=#attributes.program_year_id#
			AND Access_User_Business_Function.user_account_id IN (#attributes.user_account_id#)
		GROUP BY Access_User_Business_Function.business_function_id
		) Access_User_Business_Function ON REF_Business_Function.business_function_id=Access_User_Business_Function.business_function_id
WHERE REF_Module.active_ind=1
	AND REF_Module.viewable_ind=1
	AND REF_Screen.active_ind=1
	AND REF_Business_Function.active_ind=1
GROUP BY REF_Module.module_id, REF_Module.description, REF_Business_Function.business_function_id,
	REF_Business_Function.description, REF_Business_Function.default_access_ind, Access_User_Business_Function.business_function_id,
	REF_Module.sort_order, REF_Business_Function.sort_order
ORDER BY REF_Module.sort_order, REF_Business_Function.sort_order
</cfquery>