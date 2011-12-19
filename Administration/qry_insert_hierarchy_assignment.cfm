<!-- Administration/qry_insert_hierarchy_assignment.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_hierarchy_assignment.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/18/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.center_id" default="">
<cfquery name="insert_hierarchy_assignment" datasource="#application.datasources.main#">
<cfif isdefined("attributes.l_p_y_h_id")>
INSERT INTO Hierarchy_Assignment (organization_id, parent_organization_id, l_p_y_h_id,
	center_id, active_ind, created_by)
SELECT #attributes.organization_id# AS organization_id, <cfif attributes.parent_organization_id NEQ 0>#attributes.parent_organization_id#<cfelse>''</cfif> AS parent_organization_id, #attributes.l_p_y_h_id# AS l_p_y_h_id,
	<cfif len(attributes.center_id)>#attributes.center_id#<cfelse>''</cfif> AS center_id, 1 AS active_ind, #session.user_account_id# AS created_by
FROM Dual
<cfelse>
INSERT INTO Hierarchy_Assignment (organization_id, parent_organization_id, l_p_y_h_id,
	center_id, active_ind, created_by)
SELECT REF_Organization.organization_id, <cfif attributes.parent_organization_id NEQ 0>#attributes.parent_organization_id#<cfelse>''</cfif> AS parent_organization_id, NVL(Hierarchy_Assignment.l_p_y_h_id,1) AS l_p_y_h_id,
	<cfif len(attributes.center_id)>#attributes.center_id#<cfelse>''</cfif> AS center_id, <cfif isdefined("attributes.delete_hierarchy_assignment_ind")>0<cfelse>1</cfif> AS active_ind, #session.user_account_id# AS created_by
FROM REF_Organization, (
	/*based on the new parent organization, determine the hierarchy level the updated organization fits into*/
	SELECT Child_Hierarchy.l_p_y_h_id
	FROM (
			SELECT Hierarchy_Assignment.l_p_y_h_id, hierarchy_level_id
			FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
			WHERE Hierarchy_Assignment.active_ind=1
				AND Link_Program_Year_Hierarchy.active_ind=1
				AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
				AND Hierarchy_Assignment.organization_id=#attributes.parent_organization_id#
			GROUP BY Hierarchy_Assignment.l_p_y_h_id, hierarchy_level_id
		) Parent_Hierarchy
		INNER JOIN Link_Program_Year_Hierarchy Child_Hierarchy ON Parent_Hierarchy.hierarchy_level_id=Child_Hierarchy.parent_hierarchy_level_id
		INNER JOIN REF_Hierarchy_Level ON Child_Hierarchy.hierarchy_level_id=REF_Hierarchy_Level.hierarchy_level_id
	WHERE Child_Hierarchy.active_ind=1
		AND Child_Hierarchy.program_year_id=#attributes.program_year_id#
		AND REF_Hierarchy_Level.center_ind=0 /*customer indicates they don't want to be able to add centers*/
	) Hierarchy_Assignment
WHERE REF_Organization.organization_id=#attributes.organization_id#
</cfif>
</cfquery> 