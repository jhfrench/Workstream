<!-- common_files/qry_get_user_module_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_module_access.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
			$Id:$
			nf rewrote query on 8/8/07 to identified modules that are locked
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

<cfquery name="get_user_module_access" datasource="#application.datasources.main#">
SELECT REF_Module.module_id, REF_Module.description AS module_description, REF_Module.sort_order AS module_sort_order,
	REF_Program_Year.description AS program_year_description
FROM REF_Module
	INNER JOIN REF_Screen ON REF_Module.module_id=REF_Screen.module_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	INNER JOIN Access_User_Business_Function ON REF_Business_Function.business_function_id=Access_User_Business_Function.business_function_id
	INNER JOIN REF_Program_Year ON Access_User_Business_Function.program_year_id=REF_Program_Year.program_year_id
WHERE REF_Module.active_ind=1
	AND REF_Module.viewable_ind=1
	AND REF_Screen.active_ind=1
	AND REF_Business_Function.active_ind=1
	AND Access_User_Business_Function.active_ind=1
	AND Access_User_Business_Function.user_account_id IN (#attributes.user_account_id#)
	AND REF_Program_Year.program_year_id=#attributes.program_year_id#
GROUP BY REF_Module.module_id, REF_Module.description, REF_Module.sort_order,
	REF_Program_Year.description
ORDER BY REF_Module.sort_order
</cfquery>
<cfset caller.get_user_module_access=get_user_module_access>