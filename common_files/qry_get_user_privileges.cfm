<!-- common_files/qry_get_user_privileges.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_privileges.cfm">
	<responsibilities>
		I get all of user's access for display.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/31/2007" role="FuseCoder" comments="Created File">
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
SELECT REF_Module.module_id, REF_Module.description AS module_description, NSM_Hierarchy.nsm_level,
	CASE
		WHEN REF_Center.center_id IS NOT NULL THEN NSM_Hierarchy.organization_description||' - '||REF_Center.description
		ELSE NSM_Hierarchy.organization_description
	END AS organization_description,
	CASE
		WHEN REF_Center.center_id IS NOT NULL THEN REF_Center.abbreviation
		ELSE NSM_Hierarchy.organization_code
	END AS organization_code<cfloop list="#attributes.privilege_id#" index="privilege_id_ii">,
	SUM(CASE WHEN Access_User_Account_Grouper.privilege_id=#privilege_id_ii# THEN 1 ELSE 0 END) AS privilege_#privilege_id_ii#</cfloop>
FROM REF_Module
	INNER JOIN (
		SELECT rownum AS nsm_order, Hierarchy_Assignment.organization_id, level AS nsm_level,
			REF_Organization.description AS organization_description, REF_Organization.organization_code, 1 AS active_ind
		FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
				AND Hierarchy_Assignment.active_ind=1
				AND Link_Program_Year_Hierarchy.active_ind=1
				AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
				AND REF_Organization.active_ind=1
		START WITH Hierarchy_Assignment.parent_organization_id IS NULL
		CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
		ORDER SIBLINGS BY REF_Organization.sort_order
	) NSM_Hierarchy ON REF_Module.active_ind=NSM_Hierarchy.active_ind
	LEFT OUTER JOIN Access_User_Account_Grouper ON NSM_Hierarchy.organization_id=Access_User_Account_Grouper.organization_id
		AND REF_Module.module_id=Access_User_Account_Grouper.module_id
		AND Access_User_Account_Grouper.active_ind=1
		AND Access_User_Account_Grouper.program_year_id=#attributes.program_year_id#
		AND Access_User_Account_Grouper.user_account_id IN (#attributes.user_account_id#)
		AND Access_User_Account_Grouper.privilege_id IN (#attributes.privilege_id#)
	LEFT OUTER JOIN REF_Center ON Access_User_Account_Grouper.center_id=REF_Center.center_id
WHERE REF_Module.assign_hier_privileges_ind=1
GROUP BY REF_Module.sort_order, REF_Module.module_id, REF_Module.description,
	NSM_Hierarchy.nsm_order, NSM_Hierarchy.nsm_level, NSM_Hierarchy.organization_description,
	NSM_Hierarchy.organization_code, REF_Center.center_id, REF_Center.description,
	REF_Center.abbreviation, REF_Center.sort_order
ORDER BY REF_Module.sort_order, NSM_Hierarchy.nsm_order, REF_Center.sort_order
</cfquery>
<cfset caller.get_user_privileges=get_user_privileges>