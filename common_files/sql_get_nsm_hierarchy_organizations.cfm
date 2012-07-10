/* common_files/sql_get_nsm_hierarchy_organizations.cfm
	Author: Jeromy French */
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="sql_get_nsm_hierarchy_organizations.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.center_ind" default="0">
<cfparam name="attributes.limit_to_user_access_ind" default="0">
<cfparam name="attributes.show_all_fields_ind" default="1">
<cfparam name="attributes.start_with" default="">
<cfoutput>
SELECT <cfif attributes.show_all_fields_ind>*<cfelse>Data.organization_id</cfif>
FROM (
	<cfif attributes.center_ind>
		SELECT REF_Center.center_id, REF_Center.abbreviation AS description, REF_Center.center_code,
			REF_Hierarchy_Level.hierarchy_level_id, REF_Hierarchy_Level.description AS hierarchy_description
		FROM REF_Center
			INNER JOIN (
				SELECT center_id
				FROM Hierarchy_Assignment
					INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
						AND Hierarchy_Assignment.active_ind=1
						AND Link_Program_Year_Hierarchy.active_ind=1
						AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
				START WITH Hierarchy_Assignment.parent_organization_id<cfif NOT len(attributes.start_with)> IS NULL<cfelse> IN (#attributes.start_with#)</cfif>
				CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
			) Hierarchy_Assignment ON REF_Center.center_id=Hierarchy_Assignment.center_id
			INNER JOIN REF_Hierarchy_Level ON REF_Hierarchy_Level.hierarchy_level_id=#attributes.hierarchy_level_id#<cfif attributes.limit_to_user_access_ind>
			INNER JOIN (
				SELECT center_id
				FROM Access_User_Account_Grouper
				WHERE active_ind=1
					AND program_year_id=#attributes.program_year_id#
					AND privilege_id=2 /*only show records to which the user can write*/
					AND module_id=#attributes.module_id#<cfif len(attributes.start_with)>
					AND organization_id=#attributes.start_with#</cfif>
					AND user_account_id=#session.user_account_id#
				GROUP BY center_id
			) User_Module_Privilege ON REF_Center.center_id=User_Module_Privilege.center_id</cfif>
		WHERE REF_Center.active_ind=1
			AND REF_Center.fake_center_ind=0
		GROUP BY REF_Center.center_id, REF_Center.abbreviation, REF_Center.center_code,
			REF_Center.sort_order, REF_Hierarchy_Level.hierarchy_level_id, REF_Hierarchy_Level.description
		ORDER BY REF_Center.sort_order
	<cfelse>
		SELECT Hierarchy_Assignment.organization_id, Hierarchy_Assignment.parent_organization_id, Link_Program_Year_Hierarchy.hierarchy_level_id,
			level AS hierarchy_level/*native Oracle hierarchy function*/, LPAD(' ',2*(level-1)) || REF_Organization.description AS spaced_view, SYS_CONNECT_BY_PATH(REF_Organization.description, '&raquo;') AS path,
			REF_Organization.description AS organization_description, REF_Organization.organization_code
		FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
				AND Hierarchy_Assignment.active_ind=1
				AND Link_Program_Year_Hierarchy.active_ind=1
				AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
				AND REF_Organization.active_ind=1<cfif attributes.limit_to_user_access_ind AND NOT isdefined("attributes.hierarchy_level_id")>
			INNER JOIN Access_User_Account_Grouper ON REF_Organization.organization_id=Access_User_Account_Grouper.organization_id
				AND Access_User_Account_Grouper.program_year_id=Link_Program_Year_Hierarchy.program_year_id
				AND Access_User_Account_Grouper.active_ind=1
				AND Access_User_Account_Grouper.privilege_id=2 /*only show records to which the user can write*/
				AND Access_User_Account_Grouper.module_id=#attributes.module_id#
				AND Access_User_Account_Grouper.user_account_id=#session.user_account_id#</cfif>
		START WITH Hierarchy_Assignment.parent_organization_id<cfif NOT len(attributes.start_with)> IS NULL<cfelse> IN (#attributes.start_with#)</cfif>
		CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
	</cfif>
	) Data<cfif isdefined("attributes.hierarchy_level_id")><cfif NOT attributes.center_ind AND attributes.limit_to_user_access_ind>
	INNER JOIN Access_User_Account_Grouper ON Data.organization_id=Access_User_Account_Grouper.organization_id
		AND Access_User_Account_Grouper.program_year_id=#attributes.program_year_id#
		AND Access_User_Account_Grouper.active_ind=1
		AND Access_User_Account_Grouper.privilege_id=2 /*only show records to which the user can write*/
		AND Access_User_Account_Grouper.module_id=#attributes.module_id#
		AND Access_User_Account_Grouper.user_account_id=#session.user_account_id#</cfif>
WHERE hierarchy_level_id IN (#attributes.hierarchy_level_id#)</cfif>
</cfoutput>