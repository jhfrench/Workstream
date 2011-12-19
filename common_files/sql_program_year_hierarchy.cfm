/* common_files/sql_program_year_hierarchy.cfm
	Author: Jeromy French */
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="sql_program_year_hierarchy.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.program_year_id" default="1">
<cfoutput>
SELECT rownum AS sort_order, Hierarchy_Assignment.organization_id, level AS nsm_level,
	REF_Organization.description, REF_Organization.organization_code
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
</cfoutput>