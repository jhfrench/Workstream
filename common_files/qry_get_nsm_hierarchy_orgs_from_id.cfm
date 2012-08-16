<!-- common_files/qry_get_nsm_hierarchy_orgs_from_id.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_nsm_hierarchy_orgs_from_id.cfm">
	<responsibilities>
		I return organizations based on a hierarchy level and organization id.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="3/28/2008" role="FuseCoder" comments="Created File">
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

<cfquery name="get_nsm_hierarchy_orgs_from_id" datasource="#application.datasources.main#">
SELECT Hierarchy_Assignment.organization_id, COALESCE(Hierarchy_Assignment.parent_organization_id,0) AS parent_organization_id, REF_Organization.description || ' (' ||  REF_Organization.organization_code || ')' AS nsm_organization_description, 
	REF_Hierarchy_Level.hierarchy_level_id, REF_Hierarchy_Level.description AS hierarchy_level_description, REF_Organization.description AS nsm_description
FROM Hierarchy_Assignment 
	INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
	INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_year_Hierarchy.l_p_y_h_id
	INNER JOIN REF_Hierarchy_Level ON REF_Hierarchy_Level.hierarchy_level_id=Link_Program_Year_Hierarchy.hierarchy_level_id
WHERE Hierarchy_Assignment.active_ind=1
	AND REF_Organization.active_ind=1
	AND Link_Program_Year_Hierarchy.active_ind=1
	AND REF_Hierarchy_Level.active_ind=1
	AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
	AND Link_Program_Year_Hierarchy.hierarchy_level_id=#attributes.hierarchy_level_id#
	<cfif isdefined("attributes.organization_id")>
		AND COALESCE(Hierarchy_Assignment.parent_organization_id,0)=#attributes.organization_id#
	</cfif>
	<cfif isdefined("variables.existing_organization_id") AND len(variables.existing_organization_id)>
		AND Hierarchy_Assignment.organization_id NOT IN (#variables.existing_organization_id#)
	</cfif>
ORDER BY REF_Organization.sort_order
</cfquery>