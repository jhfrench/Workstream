<!-- common_files/qry_get_user_privileges.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_privileges.cfm">
	<responsibilities>
		I get all of user's access for display.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/31/2007" role="FuseCoder" comments="Created File">
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
<cfif NOT isdefined("attributes.privilege_id")>
	<cfset attributes.privilege_id=valuelist(get_ref_privilege.privilege_id)>
</cfif>
<cfquery name="get_user_privileges" datasource="#application.datasources.main#">
SELECT REF_Module.module_id, REF_Module.description AS module_description, Workstream_Hierarchy.nsm_level,
	CASE
		WHEN REF_Center.center_id IS NOT NULL THEN Workstream_Hierarchy.organization_description || ' - ' || REF_Center.description
		ELSE Workstream_Hierarchy.organization_description
	END AS organization_description,
	CASE
		WHEN REF_Center.center_id IS NOT NULL THEN REF_Center.abbreviation
		ELSE Workstream_Hierarchy.organization_code
	END AS organization_code<cfloop list="#attributes.privilege_id#" index="variables.privilege_id_ii">,
	SUM(CASE WHEN Access_User_Account_Grouper.privilege_id=#variables.privilege_id_ii# THEN 1 ELSE 0 END) AS privilege_#variables.privilege_id_ii#</cfloop>
FROM REF_Module
	INNER JOIN Workstream_Hierarchy(<cfqueryparam value="#attributes.program_year_id#" cfsqltype="cf_sql_integer" />) ON REF_Module.active_ind=Workstream_Hierarchy.active_ind
	LEFT OUTER JOIN Access_User_Account_Grouper ON Workstream_Hierarchy.organization_id=Access_User_Account_Grouper.organization_id
		AND REF_Module.module_id=Access_User_Account_Grouper.module_id
		AND Access_User_Account_Grouper.active_ind=1
		AND Access_User_Account_Grouper.program_year_id=<cfqueryparam value="#attributes.program_year_id#" cfsqltype="cf_sql_integer" />
		AND Access_User_Account_Grouper.user_account_id IN (<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" list="true" />)
		AND Access_User_Account_Grouper.privilege_id IN (<cfqueryparam value="#attributes.privilege_id#" cfsqltype="cf_sql_integer" list="true" />)
	LEFT OUTER JOIN REF_Center ON Access_User_Account_Grouper.center_id=REF_Center.center_id
WHERE REF_Module.assign_hier_privileges_ind=1
GROUP BY REF_Module.sort_order, REF_Module.module_id, REF_Module.description,
	Workstream_Hierarchy.sort_order, Workstream_Hierarchy.workstream_level, Workstream_Hierarchy.organization_description,
	Workstream_Hierarchy.organization_code, REF_Center.center_id, REF_Center.description,
	REF_Center.abbreviation, REF_Center.sort_order
ORDER BY REF_Module.sort_order, Workstream_Hierarchy.sort_order, REF_Center.sort_order
</cfquery>
<cfset caller.get_user_privileges=get_user_privileges>