/* common_files/sql_get_user_organization_privilege_access.cfm
	Author: Jeromy French */
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="sql_get_user_organization_privilege_access.cfm">
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
<cfparam name="attributes.limit_to_user_access_ind" default="0">
<cfparam name="attributes.privilege_id" default="2"><!--- default is write access --->
<cfparam name="attributes.start_with" default="">
<cfoutput>
SELECT Privilege_Crosstab.organization_id, Privilege_Crosstab.parent_organization_id, Privilege_Crosstab.hierarchy_level_id,
	Privilege_Crosstab.hierarchy_level, Privilege_Crosstab.spaced_view, Privilege_Crosstab.path,
	Privilege_Crosstab.organization_description, Privilege_Crosstab.organization_code<cfloop list="#attributes.privilege_id#" index="variables.privilege_id">,
	MAX(privilege_#variables.privilege_id#_ind) AS privilege_#variables.privilege_id#_ind</cfloop>
FROM (
	SELECT Hierarchy_Assignment.organization_id, Hierarchy_Assignment.parent_organization_id, Link_Program_Year_Hierarchy.hierarchy_level_id,
		level AS hierarchy_level/*native Oracle hierarchy function*/, LPAD(' ',2*(level-1)) + REF_Organization.description AS spaced_view, SYS_CONNECT_BY_PATH(REF_Organization.description, '&raquo;') AS path,
		REF_Organization.description AS organization_description, REF_Organization.organization_code<cfloop list="#attributes.privilege_id#" index="variables.privilege_id">,
	CASE WHEN Access_User_Account_Grouper.privilege_id=#variables.privilege_id# THEN 1 ELSE 0 END AS privilege_#variables.privilege_id#_ind</cfloop>
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
			AND Access_User_Account_Grouper.privilege_id IN (#attributes.privilege_id#)
			AND Access_User_Account_Grouper.module_id=#attributes.module_id#
			AND Access_User_Account_Grouper.user_account_id=#session.user_account_id#</cfif>
	START WITH Hierarchy_Assignment.parent_organization_id<cfif NOT len(attributes.start_with)> IS NULL<cfelse> IN (#attributes.start_with#)</cfif>
	CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id
	ORDER SIBLINGS BY REF_Organization.sort_order
) Privilege_Crosstab
GROUP BY Privilege_Crosstab.organization_id, Privilege_Crosstab.parent_organization_id, Privilege_Crosstab.hierarchy_level_id,
	Privilege_Crosstab.hierarchy_level, Privilege_Crosstab.spaced_view, Privilege_Crosstab.path,
	Privilege_Crosstab.organization_description, Privilege_Crosstab.organization_code
</cfoutput>