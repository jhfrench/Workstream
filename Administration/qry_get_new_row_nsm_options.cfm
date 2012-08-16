<!-- Administration/qry_get_new_row_nsm_options.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_new_row_nsm_options.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="4/7/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 4/3/2008)
			Marlana says the mission/theme select boxes are to be populated from the regular NSM structure (see FAAD\trunk\documentation\Release_2.0\RE: question for Manage Apportionment piece.msg).
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
<cfquery name="get_new_row_nsm_options" datasource="#application.datasources.main#">
SELECT Parent_Data.organization_id AS parent_id, Parent_Data.description AS parent_description, Parent_Data.organization_code AS parent_code,
	Child_Data.organization_id AS child_id, Child_Data.description AS child_description, Child_Data.organization_code AS child_code
FROM (
	SELECT Hierarchy_Assignment.organization_id, REF_Organization.description, REF_Organization.organization_code,
		REF_Organization.sort_order
	FROM Hierarchy_Assignment
		INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
		INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
			AND Hierarchy_Assignment.active_ind=1
			AND Link_Program_Year_Hierarchy.active_ind=1
			AND REF_Organization.active_ind=1
			AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
			AND Hierarchy_Assignment.parent_organization_id IS NULL
	) Parent_Data
	INNER JOIN (
		SELECT Hierarchy_Assignment.parent_organization_id, Hierarchy_Assignment.organization_id, REF_Organization.description,
			REF_Organization.organization_code, REF_Organization.sort_order
		FROM Hierarchy_Assignment
			INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
			INNER JOIN REF_Organization ON Hierarchy_Assignment.organization_id=REF_Organization.organization_id
				AND Hierarchy_Assignment.active_ind=1
				AND Link_Program_Year_Hierarchy.active_ind=1
				AND REF_Organization.active_ind=1
				AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#<cfif get_display_apportionment_results.recordcount>
				AND Hierarchy_Assignment.organization_id NOT IN (#valuelist(get_display_apportionment_results.child_id)#)</cfif>
	) Child_Data ON Parent_Data.organization_id=Child_Data.parent_organization_id
ORDER BY Parent_Data.sort_order, Child_Data.sort_order
</cfquery>