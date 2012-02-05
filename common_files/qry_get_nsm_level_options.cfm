<!-- common_files/qry_get_nsm_level_options.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_nsm_level_options.cfm">
	<responsibilities>
		I get the meta-data that describes the different groupers that make up the NSM structure for the specified program year.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.limit_all_options" default="0">
<cfparam name="attributes.dig_deep_ind" default="0">
<cfparam name="attributes.privilege_id" default="2">

<!--- the parent privilege inheritance technique builds the query backwards, but we still want the resulting records ordered by the traditional hierarchy order --->
<cfif attributes.parent_privilege_inheritance_ind>
	<cfset variables.true_sort="">
	<cfloop query="get_nsm_levels">
	<cfset variables.true_sort=listprepend(variables.true_sort,hierarchy_level_id)>
	</cfloop>
<cfelse>
	<cfset variables.true_sort=valuelist(get_nsm_levels.hierarchy_level_id)>
</cfif>

<cfset variables.limit_options_ind=0>
<cfquery name="get_nsm_level_options" datasource="#application.datasources.main#">
SELECT <cfloop query="get_nsm_levels">NSM_Level_#hierarchy_level_id#.organization_id AS level_#hierarchy_level_id#_organization_id, NSM_Level_#hierarchy_level_id#.level_#hierarchy_level_id#_display,
	</cfloop>1 AS sql_field
FROM<cfloop query="get_nsm_levels">
<cfif currentrow EQ get_nsm_levels.recordcount>
	<cfset variables.limit_options_ind=1>
</cfif>(<cfif variables.limit_options_ind EQ 0>
		<cfif attributes.parent_privilege_inheritance_ind>
		SELECT Elligible_Organizations.parent_organization_id, Elligible_Organizations.organization_id, Elligible_Organizations.l_p_y_h_id,
			REF_Organization.description + ' (' + REF_Organization.organization_code + ')' AS level_#hierarchy_level_id#_display, REF_Organization.sort_order, #hierarchy_level_id# AS hierarchy_level_id
		FROM REF_Organization 
			INNER JOIN (
				SELECT Hierarchy_Assignment.parent_organization_id, Hierarchy_Assignment.organization_id, Hierarchy_Assignment.l_p_y_h_id
				FROM Hierarchy_Assignment
					INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
						AND Hierarchy_Assignment.active_ind=1
						AND Link_Program_Year_Hierarchy.active_ind=1
						AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
				START WITH Hierarchy_Assignment.organization_id IN (
					SELECT organization_id
					FROM Access_User_Account_Grouper
					WHERE Access_User_Account_Grouper.active_ind=1
						AND Access_User_Account_Grouper.program_year_id=#attributes.program_year_id#
						AND Access_User_Account_Grouper.module_id=#attributes.module_id#
						AND Access_User_Account_Grouper.privilege_id=#attributes.privilege_id#
						AND Access_User_Account_Grouper.user_account_id=#session.user_account_id#
				)
				CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
			) Elligible_Organizations ON REF_Organization.organization_id=Elligible_Organizations.organization_id
		WHERE REF_Organization.active_ind=1
			AND Elligible_Organizations.l_p_y_h_id=#get_nsm_levels.l_p_y_h_id#
		GROUP BY Elligible_Organizations.parent_organization_id, Elligible_Organizations.organization_id, Elligible_Organizations.l_p_y_h_id,
			REF_Organization.description, REF_Organization.organization_code, REF_Organization.sort_order
	) NSM_Level_#hierarchy_level_id#
		<cfelse>
		SELECT REF_Organization.description + ' (' + REF_Organization.organization_code + ')'  AS level_#hierarchy_level_id#_display, REF_Organization.organization_id, REF_Organization.sort_order,
			Hierarchy_Assignment.parent_organization_id, #hierarchy_level_id# AS hierarchy_level_id
		FROM Hierarchy_Assignment
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id<cfif variables.limit_options_ind EQ 1>
			INNER JOIN Access_User_Account_Grouper ON REF_Organization.organization_id=Access_User_Account_Grouper.organization_id
				AND Access_User_Account_Grouper.program_year_id=#attributes.program_year_id#</cfif>
		WHERE Hierarchy_Assignment.active_ind=1
			AND REF_Organization.active_ind=1
			AND Hierarchy_Assignment.l_p_y_h_id=#l_p_y_h_id#
	) NSM_Level_#hierarchy_level_id#<cfif currentrow NEQ 1> ON NSM_Level_#variables.previous_hierarchy_level_id#.organization_id=NSM_Level_#hierarchy_level_id#.parent_organization_id
		OR NSM_Level_#variables.previous_hierarchy_level_id#.organization_id IN (
				SELECT organization_id
				FROM Access_User_Account_Grouper
				WHERE Access_User_Account_Grouper.active_ind=1
					AND Access_User_Account_Grouper.program_year_id=#attributes.program_year_id#
					AND Access_User_Account_Grouper.module_id=#attributes.module_id#
					AND Access_User_Account_Grouper.privilege_id=#attributes.privilege_id#
					AND Access_User_Account_Grouper.user_account_id=#session.user_account_id#
			)</cfif>
		</cfif>
	INNER JOIN<cfelse>
		<cfif attributes.parent_privilege_inheritance_ind>
		SELECT Hierarchy_Assignment.parent_organization_id, Hierarchy_Assignment.organization_id, Hierarchy_Assignment.l_p_y_h_id,
			REF_Organization.description + ' (' + REF_Organization.organization_code + ')'  AS level_#hierarchy_level_id#_display, REF_Organization.sort_order, #hierarchy_level_id# AS hierarchy_level_id
		FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
		WHERE Hierarchy_Assignment.active_ind=1
			AND Link_Program_Year_Hierarchy.active_ind=1
			AND REF_Organization.active_ind=1
			AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
		) NSM_Level_#hierarchy_level_id#<cfif currentrow NEQ 1> ON NSM_Level_#variables.previous_hierarchy_level_id#.parent_organization_id=NSM_Level_#hierarchy_level_id#.organization_id</cfif>
		<cfelse>
		/*Dig deeper to find descendant privilieges*/
		SELECT REF_Organization.description + ' (' + REF_Organization.organization_code + ')'  AS level_#hierarchy_level_id#_display, REF_Organization.organization_id, REF_Organization.sort_order,
			Hierarchy_Assignment.parent_organization_id, #hierarchy_level_id# AS hierarchy_level_id
		FROM Hierarchy_Assignment
			INNER JOIN (
				/*retrieve all the level #l_p_y_h_id# organizations (ancestors) if any of that ancestor's desendants have the relevant access*/
				SELECT organization_id
				FROM (
					SELECT CONNECT_BY_ROOT(Hierarchy_Assignment.organization_id) AS organization_id, ISNULL(Access_User_Account_Grouper.active_ind,0) AS child_access_count
					FROM Hierarchy_Assignment
						INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
							AND Hierarchy_Assignment.active_ind=1
							AND Link_Program_Year_Hierarchy.active_ind=1
							AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
						LEFT OUTER JOIN Access_User_Account_Grouper ON Hierarchy_Assignment.organization_id=Access_User_Account_Grouper.organization_id
							AND Access_User_Account_Grouper.active_ind=1
							AND Access_User_Account_Grouper.program_year_id=#attributes.program_year_id#
							AND Access_User_Account_Grouper.user_account_id=#session.user_account_id#
							AND Access_User_Account_Grouper.module_id=#attributes.module_id#
							AND Access_User_Account_Grouper.privilege_id=#attributes.privilege_id#
					START WITH Hierarchy_Assignment.l_p_y_h_id=#l_p_y_h_id#
					CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
					) Dig_Deep
				GROUP BY organization_id
				HAVING SUM(child_access_count) > 0
				) Dig_Deep ON Hierarchy_Assignment.organization_id=Dig_Deep.organization_id
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
		WHERE Hierarchy_Assignment.active_ind=1
			AND REF_Organization.active_ind=1
			AND Hierarchy_Assignment.l_p_y_h_id=#l_p_y_h_id#
		) NSM_Level_#hierarchy_level_id#<cfif currentrow NEQ 1> ON NSM_Level_#variables.previous_hierarchy_level_id#.organization_id=NSM_Level_#hierarchy_level_id#.parent_organization_id</cfif></cfif>
		</cfif><cfset variables.previous_hierarchy_level_id=hierarchy_level_id>
</cfloop>
ORDER BY <cfloop list="#variables.true_sort#" index="variables.true_sort_ii">NSM_Level_#variables.true_sort_ii#.hierarchy_level_id, NSM_Level_#variables.true_sort_ii#.sort_order,
	</cfloop>sql_field
</cfquery>