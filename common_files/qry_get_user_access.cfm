<!-- common_files/qry_get_user_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_access.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
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
	REF_Business_Function.hiearchy_level, REF_Business_Function.sort_order AS business_function_sort_order, COALESCE(Navigation_Child_Count.child_count,0) AS child_count,
	REF_Screen.screen_id, REF_Screen.fuseaction, REF_Screen.starting_point_ind,
	CASE
		WHEN Lock_Module.module_id IS NULL THEN 0
		ELSE 1
	END AS locked_ind
FROM REF_Module
	INNER JOIN REF_Screen ON REF_Module.module_id=REF_Screen.module_id
	INNER JOIN (
			SELECT COALESCE(Parent_Business_Function.business_function_id,Child_Business_Function.business_function_id) AS parent_business_function_id, COALESCE(Parent_Business_Function.description, Child_Business_Function.description) AS parent_business_function, Child_Business_Function.business_function_id,
				Child_Business_Function.description, Child_Business_Function.viewable_ind, Child_Business_Function.require_login_ind,
				/* ROW_NUMBER() OVER(ORDER BY COALESCE(Parent_Business_Function.sort_order,Child_Business_Function.sort_order), Parent_Business_Function.business_function_id, Child_Business_Function.sort_order) AS sort_order, */
				COALESCE(Parent_Business_Function.sort_order,Child_Business_Function.sort_order) AS sort_order, 
				CASE 
					WHEN COALESCE(Child_Count.child_count,0)!=0 THEN 0
					ELSE 1
				END AS leaf_ind,
				CASE
					WHEN COALESCE(Parent_Business_Function.business_function_id,Child_Business_Function.business_function_id)!=Child_Business_Function.business_function_id THEN 2
					ELSE 1
				END AS hiearchy_level
			FROM REF_Business_Function AS Child_Business_Function
				LEFT OUTER JOIN REF_Business_Function AS Parent_Business_Function ON Parent_Business_Function.business_function_id=Child_Business_Function.parent_business_function_id
					AND Parent_Business_Function.active_ind=1
				LEFT OUTER JOIN (
					SELECT REF_Business_Function.parent_business_function_id, COUNT(*) AS child_count
					FROM REF_Business_Function
					WHERE active_ind=1
					GROUP BY REF_Business_Function.parent_business_function_id
				) AS Child_Count ON Child_Business_Function.business_function_id=Child_Count.parent_business_function_id
			WHERE Child_Business_Function.active_ind=1
	) REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	LEFT OUTER JOIN (
		SELECT REF_Business_Function.parent_business_function_id, COUNT(*) AS child_count
		FROM REF_Business_Function
		WHERE active_ind=1
		GROUP BY REF_Business_Function.parent_business_function_id
	) Navigation_Child_Count ON REF_Business_Function.parent_business_function_id=Navigation_Child_Count.parent_business_function_id
	LEFT OUTER JOIN Lock_Module ON REF_Module.module_id=Lock_Module.module_id
		AND Lock_Module.active_ind=1
WHERE REF_Module.active_ind=1
	AND REF_Module.viewable_ind=1
	AND REF_Screen.active_ind=1
	AND REF_Business_Function.viewable_ind=1 /*this is for nav, so only show business functions that should be viewable in the nav*/
	AND (REF_Business_Function.require_login_ind=0 /*show the screens that don't require login*/<cfif isdefined("variables.user_identification")>
		OR REF_Business_Function.business_function_id IN (
			SELECT Access_User_Business_Function.business_function_id
			FROM Access_User_Business_Function
			WHERE Access_User_Business_Function.active_ind=1
				AND Access_User_Business_Function.user_account_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#">
				AND Access_User_Business_Function.program_year_id=1)</cfif>)
ORDER BY REF_Module.sort_order, REF_Business_Function.sort_order
</cfquery>
<cfset caller.get_user_access=get_user_access>