/* common_files/sql_get_grouper_options_and_user_privileges.cfm
	Author: Jeromy French */

<cfparam name="attributes.center_ind" default="0">
<cfoutput>
<!--- if the user is dealing with the center level of the heirarchy, get the centers associated with the children of the specified parent organziation --->
<cfif attributes.center_ind>
SELECT REF_Center.center_id, REF_Center.abbreviation AS description, REF_Center.center_code,
	<cfloop query="get_module_privilege_details">
	COALESCE(User_Module_Privilege.#get_module_privilege_details.privilege_label#_ind,0) AS #get_module_privilege_details.privilege_label#_ind,</cfloop>
	REF_Hierarchy_Level.description AS hierarchy_description
FROM REF_Center
	INNER JOIN (
		SELECT center_id
		FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
				AND Hierarchy_Assignment.active_ind=1
				AND Link_Program_Year_Hierarchy.active_ind=1
				AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
		START WITH Hierarchy_Assignment.parent_organization_id <cfif compare(attributes.nsm_drilldown_organizations,0)>IN (#attributes.nsm_drilldown_organizations#)<cfelse>IS NULL</cfif>
		CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
	) Hierarchy_Assignment ON REF_Center.center_id=Hierarchy_Assignment.center_id
	INNER JOIN Link_Program_Year_Hierarchy ON Link_Program_Year_Hierarchy.l_p_y_h_id=#attributes.l_p_y_h_id#
	INNER JOIN REF_Hierarchy_Level ON Link_Program_Year_Hierarchy.hierarchy_level_id=REF_Hierarchy_Level.hierarchy_level_id
	LEFT OUTER JOIN (
		SELECT center_id,<cfloop query="get_module_privilege_details">
			MAX(CASE WHEN privilege_id=#get_module_privilege_details.privilege_id# THEN 1 ELSE 0 END) AS #get_module_privilege_details.privilege_label#_ind,</cfloop>
			1 AS trailing_column_for_sql
		FROM Access_User_Account_Grouper
		WHERE active_ind=1
			AND program_year_id=#attributes.program_year_id#
			AND module_id=#attributes.module_id#
			AND organization_id=#attributes.nsm_drilldown_organizations#
			AND user_account_id IN (#attributes.user_account_id#)
			AND privilege_id IN (#variables.relevant_privileges#) /*limit number of records DB has to group*/
		GROUP BY center_id
	) User_Module_Privilege ON REF_Center.center_id=User_Module_Privilege.center_id
WHERE REF_Center.active_ind=1
	AND Link_Program_Year_Hierarchy.active_ind=1
	AND REF_Center.fake_center_ind=0
	AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
GROUP BY REF_Center.center_id, REF_Center.abbreviation, REF_Center.center_code,
	REF_Center.sort_order,<cfloop query="get_module_privilege_details">
	User_Module_Privilege.#get_module_privilege_details.privilege_label#_ind,</cfloop> REF_Hierarchy_Level.description
ORDER BY REF_Center.sort_order

<cfsavecontent variable="variables.affected_center_id">
SELECT REF_Center.center_id
FROM REF_Center
	INNER JOIN (
		SELECT center_id
		FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
				AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
		START WITH Hierarchy_Assignment.parent_organization_id <cfif compare(attributes.nsm_drilldown_organizations,0)>IN (#attributes.nsm_drilldown_organizations#)<cfelse>IS NULL</cfif>
		CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
	) Hierarchy_Assignment ON REF_Center.center_id=Hierarchy_Assignment.center_id
WHERE REF_Center.active_ind=1
	AND REF_Center.fake_center_ind=0
GROUP BY REF_Center.center_id
</cfsavecontent>

<cfelse>
SELECT REF_Organization.organization_id, REF_Organization.description, REF_Organization.organization_code,
	REF_Organization.abbreviation,<cfloop query="get_module_privilege_details">
	COALESCE(User_Module_Privilege.#get_module_privilege_details.privilege_label#_ind,0) AS #get_module_privilege_details.privilege_label#_ind,</cfloop>
	REF_Hierarchy_Level.description AS hierarchy_description
FROM REF_Organization
	INNER JOIN Hierarchy_Assignment ON REF_Organization.organization_id=Hierarchy_Assignment.organization_id
	INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
	INNER JOIN REF_Hierarchy_Level ON Link_Program_Year_Hierarchy.hierarchy_level_id=REF_Hierarchy_Level.hierarchy_level_id
	LEFT OUTER JOIN (
		SELECT organization_id,<cfloop query="get_module_privilege_details">
			MAX(CASE WHEN privilege_id=#get_module_privilege_details.privilege_id# THEN 1 ELSE 0 END) AS #get_module_privilege_details.privilege_label#_ind,</cfloop>
			1 AS trailing_column_for_sql
		FROM Access_User_Account_Grouper
		WHERE active_ind=1
			AND program_year_id=#attributes.program_year_id#
			AND module_id=#attributes.module_id#
			AND user_account_id IN (#attributes.user_account_id#)
			AND privilege_id IN (#variables.relevant_privileges#) /*limit number of records DB has to group*/
			AND center_id IS NULL /*exclude center children*/
		GROUP BY organization_id
	) User_Module_Privilege ON REF_Organization.organization_id=User_Module_Privilege.organization_id
WHERE REF_Organization.active_ind=1
	AND Hierarchy_Assignment.active_ind=1
	AND Link_Program_Year_Hierarchy.active_ind=1
	AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
	AND Hierarchy_Assignment.parent_organization_id <cfif compare(attributes.nsm_drilldown_organizations,0)>IN (#attributes.nsm_drilldown_organizations#)<cfelse>IS NULL</cfif>
GROUP BY REF_Organization.organization_id, REF_Organization.description, REF_Organization.organization_code,
	REF_Organization.abbreviation, REF_Organization.sort_order,<cfloop query="get_module_privilege_details">
	User_Module_Privilege.#get_module_privilege_details.privilege_label#_ind,</cfloop> REF_Hierarchy_Level.description
ORDER BY REF_Organization.sort_order, REF_Organization.description

<cfsavecontent variable="variables.affected_organization_id">
SELECT REF_Organization.organization_id
FROM REF_Organization
	INNER JOIN Hierarchy_Assignment ON REF_Organization.organization_id=Hierarchy_Assignment.organization_id
	INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
WHERE REF_Organization.active_ind=1
	AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
	AND Hierarchy_Assignment.parent_organization_id <cfif compare(attributes.nsm_drilldown_organizations,0)>IN (#attributes.nsm_drilldown_organizations#)<cfelse>IS NULL</cfif>
GROUP BY REF_Organization.organization_id
</cfsavecontent>
</cfif>
</cfoutput>