<!-- common_files/qry_get_level_hierarchy_level_id_organization_id.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_level_hierarchy_level_id_organization_id.cfm">
	<responsibilities>
		I get organization data for a specified hierarchy level.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/2/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_level_#hierarchy_level_id#_organization_id" datasource="#application.datasources.main#">
SELECT REF_Organization.description, REF_Organization.organization_id, REF_Organization.sort_order,
	Hierarchy_Assignment.parent_organization_id, Link_Program_Year_Hierarchy.hierarchy_level_id
FROM Hierarchy_Assignment
	INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
	INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id<cfif variables.limit_options_ind EQ 1>
	INNER JOIN Access_User_Account_Grouper ON REF_Organization.organization_id=Access_User_Account_Grouper.organization_id
		AND Access_User_Account_Grouper.program_year_id=Link_Program_Year_Hierarchy.program_year_id</cfif>
WHERE Hierarchy_Assignment.active_ind=1
	AND Link_Program_Year_Hierarchy.active_ind=1
	AND REF_Organization.active_ind=1
	AND Link_program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
	AND Link_Program_Year_Hierarchy.hierarchy_level_id=#hierarchy_level_id#<cfif variables.limit_options_ind EQ 1>
	AND Access_User_Account_Grouper.active_ind=1
	AND Access_User_Account_Grouper.privilege_id=2 /*only show records to which the user can write*/
	AND Access_User_Account_Grouper.module_id=#attributes.module_id#
	AND Access_User_Account_Grouper.user_account_id=#session.user_account_id#</cfif>
ORDER BY REF_Organization.sort_order
</cfquery>