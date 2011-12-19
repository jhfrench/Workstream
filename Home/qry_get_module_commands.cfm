<!-- common_files/qry_get_module_commands.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_module_commands.cfm">
	<responsibilities>
		I retrieve module access for the user.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/28/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
			attributes.module_id
			session.program_year_id
			session.user_account_id
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->

<cfquery name="get_module_commands" datasource="#application.datasources.main#">
SELECT REF_Module.description AS module_description, REF_Business_Function.business_function_id, REF_Business_Function.description AS business_function_description,
	REF_screen.fuseaction, REF_Business_Function.navigation_type_id
FROM REF_Module
	INNER JOIN REF_Screen ON REF_Module.module_id=REF_Screen.module_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	INNER JOIN Access_User_Business_Function ON REF_Business_Function.business_function_id=Access_User_Business_Function.business_function_id
WHERE REF_Module.active_ind=1
	AND REF_Module.viewable_ind=1
	AND REF_Screen.active_ind=1
	AND REF_Screen.starting_point_ind=1
	AND REF_Business_Function.active_ind=1
	AND REF_Business_Function.viewable_ind=1
	AND Access_User_Business_Function.active_ind=1
	AND Access_User_Business_Function.program_year_id=#session.program_year_id#
	AND Access_User_Business_Function.user_account_id=#session.user_account_id#
	AND REF_Module.module_id=#attributes.module_id#
GROUP BY REF_Module.description, REF_Business_Function.business_function_id, REF_Business_Function.description,
	REF_screen.fuseaction, REF_Business_Function.sort_order, REF_Business_Function.navigation_type_id
ORDER BY REF_Business_Function.sort_order
</cfquery>