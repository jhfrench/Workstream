<!-- Administration/qry_get_nsm_entity.cfm
	Author: Jeromy French-->
<!--- -->

<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_nsm_entity.cfm">
	<responsibilities>
		Query to get NSM entity.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/5/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_nsm_entity" datasource="#application.datasources.main#">
SELECT REF_Organization.organization_id, REF_Organization.description, REF_Organization.organization_code,
	REF_Organization.abbreviation, Hierarchy_Assignment.hierarchy_assignment_id, Hierarchy_Assignment.parent_organization_id
FROM REF_Organization
	INNER JOIN Hierarchy_Assignment ON REF_Organization.organization_id=Hierarchy_Assignment.organization_id
	INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
WHERE Hierarchy_Assignment.active_ind=1
	AND Link_Program_Year_Hierarchy.active_ind=1
	AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
	AND REF_Organization.organization_id=#attributes.organization_id#
</cfquery>