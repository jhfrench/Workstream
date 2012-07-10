<!-- Administration/qry_get_link_program_year_hierarchy.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_link_program_year_hierarchy.cfm">
	<responsibilities>
		Query to get link program year hierarchy.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.l_p_y_h_id" default="0">

<cfquery name="get_link_program_year_hierarchy" datasource="#application.datasources.main#">
SELECT Link_Program_Year_Hierarchy.l_p_y_h_id, Link_Program_Year_Hierarchy.hierarchy_level_id, Link_Program_Year_Hierarchy.program_year_id,
	Link_Program_Year_Hierarchy.sort_order, REF_Program_Year.description as program_year, REF_Hierarchy_Level.description as hierarchy_level,
	REF_Program_Year.description || ' / ' || REF_Hierarchy_Level.description AS program_year_hierarchy_level
FROM Link_Program_Year_Hierarchy
	INNER JOIN REF_Program_Year ON Link_Program_Year_Hierarchy.program_year_id=REF_Program_Year.program_year_id
	INNER JOIN REF_Hierarchy_Level ON Link_Program_Year_Hierarchy.hierarchy_level_id=REF_Hierarchy_Level.hierarchy_level_id
WHERE Link_Program_Year_Hierarchy.active_ind=1
	AND REF_Program_Year.active_ind=1
	AND REF_Hierarchy_Level.active_ind=1<cfif attributes.l_p_y_h_id NEQ 0>
	AND Link_Program_Year_Hierarchy.l_p_y_h_id=#attributes.l_p_y_h_id#</cfif>
ORDER BY Link_Program_Year_Hierarchy.l_p_y_h_id
</cfquery>
