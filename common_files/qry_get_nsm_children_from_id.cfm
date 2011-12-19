<!-- Common/qry_get_nsm_children_from_id.cfm
	Author: Kelly Poon-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_nsm_children_from_id.cfm">
	<responsibilities>
		I return all the children organizations based on an organization id.
	</responsibilities>
	<properties>
		<history email="kpoon@hq.nasa.gov" author="Kelly Poon" type="create" date="3/30/2008" role="FuseCoder" comments="Created File">
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

<cfquery name="get_nsm_children_from_id" datasource="#application.datasources.main#">
	select a.* from 
		(SELECT Hierarchy_Assignment.organization_id, NVL(Hierarchy_Assignment.parent_organization_id,0) AS parent_organization_id, Link_Program_Year_Hierarchy.hierarchy_level_id,
			REF_Organization.description AS organization_description, REF_Organization.organization_code
		FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
  			AND Hierarchy_Assignment.active_ind=1
  			AND Link_Program_Year_Hierarchy.active_ind=1
  			AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
  			AND REF_Organization.active_ind=1
  			START WITH NVL(Hierarchy_Assignment.parent_organization_id,0)= #attributes.delete_organization_id#
  			CONNECT BY PRIOR Hierarchy_Assignment.organization_id=Hierarchy_Assignment.parent_organization_id) a
	 WHERE 1=1
	<cfif isdefined("attributes.lowest_hierarchy_level_delete")>
		AND a.hierarchy_level_id=#attributes.lowest_hierarchy_level_delete#
	</cfif>
	order by a.hierarchy_level_id
</cfquery>
<cfset caller.get_nsm_children_from_id=get_nsm_children_from_id>

