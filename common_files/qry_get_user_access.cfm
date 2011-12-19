<!-- common_files/qry_get_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_access.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(8/8/7 | nf)
			rewrote query to identified modules that are locked
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
<cfquery name="get_user_access" datasource="#application.datasources.main#">
SELECT REF_Module.module_id, REF_Module.description AS module_description, REF_Module.sort_order AS module_sort_order,
	REF_Business_Function.parent_business_function_id, REF_Business_Function.parent_business_function, REF_Business_Function.business_function_id,
	REF_Business_Function.description AS business_function_description, REF_Business_Function.leaf_ind, 
	REF_Business_Function.hiearchy_level, REF_Business_Function.sort_order AS business_function_sort_order, NVL(Navigation_Child_Count.child_count,0) AS child_count,
	REF_Screen.screen_id, REF_Screen.fuseaction, REF_Screen.starting_point_ind,
	CASE
		WHEN Lock_Module.module_id IS NULL THEN 0
		ELSE 1
	END AS locked_ind
FROM REF_Module
	INNER JOIN REF_Screen ON REF_Module.module_id=REF_Screen.module_id
	INNER JOIN (
		SELECT CONNECT_BY_ROOT(REF_Business_Function.business_function_id) AS parent_business_function_id, CONNECT_BY_ROOT(REF_Business_Function.description) AS parent_business_function, REF_Business_Function.business_function_id,
			REF_Business_Function.description, REF_Business_Function.viewable_ind, REF_Business_Function.require_login_ind,
			rownum AS sort_order, CONNECT_BY_ISLEAF AS leaf_ind, level AS hiearchy_level
		FROM REF_Business_Function
		WHERE REF_Business_Function.active_ind=1
		START WITH REF_Business_Function.parent_business_function_id IS NULL
		CONNECT BY PRIOR REF_Business_Function.business_function_id=REF_Business_Function.parent_business_function_id
		ORDER SIBLINGS BY REF_Business_Function.sort_order
	) REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	LEFT OUTER JOIN (
		SELECT parent_business_function_id, SUM(active_ind) AS child_count
		FROM REF_Business_Function
		GROUP BY parent_business_function_id
	) Navigation_Child_Count ON REF_Business_Function.parent_business_function_id=Navigation_Child_Count.parent_business_function_id
	LEFT OUTER JOIN Lock_Module ON REF_Module.module_id=Lock_Module.module_id
		AND Lock_Module.active_ind=1
WHERE REF_Module.active_ind=1
	AND REF_Module.viewable_ind=1
	AND REF_Screen.active_ind=1<cfif len(variables.modules_allowed)>
	AND REF_Module.module_id IN (#variables.modules_allowed#) /*set in Application.cfm*/</cfif>
	AND REF_Business_Function.viewable_ind=1 /*this is for nav, so only show business functions that should be viewable in the nav*/
	AND (REF_Business_Function.require_login_ind=0 /*show the screens that don't require login*/<cfif isdefined("session.user_account_id")>
		OR REF_Business_Function.business_function_id IN (
			SELECT Access_User_Business_Function.business_function_id
			FROM Access_User_Business_Function
			WHERE Access_User_Business_Function.active_ind=1
				AND Access_User_Business_Function.user_account_id=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.user_account_id#">
				AND Access_User_Business_Function.program_year_id=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#session.program_year_id#">)</cfif>)
ORDER BY REF_Module.sort_order, REF_Business_Function.sort_order
</cfquery>
<cfset caller.get_user_access=get_user_access>