<!-- common_files/qry_get_next_hierarchy_drilldown_options.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_next_hierarchy_drilldown_options.cfm">
	<responsibilities>
		I get next hierarchy drilldown options from REF_Hierarchy_Level table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="8/23/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.restrict_by_business_function_hierarchy_ind" default="0">

<cfquery name="get_next_hierarchy_drilldown_options" datasource="#application.datasources.main#">
SELECT REF_Hierarchy_Level.description AS hierarchy_level_label, Children_Hierarchy.l_p_y_h_id, REF_Hierarchy_Level.center_ind
FROM REF_Hierarchy_Level
	INNER JOIN Link_Program_Year_Hierarchy Children_Hierarchy ON REF_Hierarchy_Level.hierarchy_level_id=Children_Hierarchy.hierarchy_level_id
	INNER JOIN Link_Program_Year_Hierarchy Parent_Hierarchy ON Children_Hierarchy.parent_hierarchy_level_id=Parent_Hierarchy.hierarchy_level_id
		AND Children_Hierarchy.program_year_id=Parent_Hierarchy.program_year_id<cfif attributes.restrict_by_business_function_hierarchy_ind>
	INNER JOIN Link_Business_Function_Hier ON Children_Hierarchy.l_p_y_h_id=Link_Business_Function_Hier.l_p_y_h_id
		AND Link_Business_Function_Hier.active_ind=1
	INNER JOIN REF_Screen ON Link_Business_Function_Hier.business_function_id=REF_Screen.business_function_id
		AND REF_Screen.active_ind=1
		AND REF_Screen.fuseaction='#attributes.fuseaction#'</cfif>
WHERE REF_Hierarchy_Level.active_ind=1
	AND Children_Hierarchy.active_ind=1
	AND Parent_Hierarchy.active_ind=1
	AND Parent_Hierarchy.l_p_y_h_id=#attributes.l_p_y_h_id#
</cfquery>
