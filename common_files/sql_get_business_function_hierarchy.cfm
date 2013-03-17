/* common_files/sql_get_business_function_hierarchy.cfm
	Author: Jeromy French */
<cfparam name="attributes.use_fuseaction_ind" default="0">
<cfparam name="attributes.exclude_center_ind" default="0">
<cfparam name="attributes.consolidate_required_hierarchy_levels_ind" default="0">
<cfoutput>
SELECT REF_Hierarchy_Level.hierarchy_level_id, REF_Hierarchy_Level.description AS hierarchy_level_label, REF_Hierarchy_Level.center_ind,
	Hierarchy_Structure.sort_order AS program_year_sort_order, Hierarchy_Structure.l_p_y_h_id, Link_Business_Function_Hier.module_id,
	<cfif attributes.consolidate_required_hierarchy_levels_ind EQ 0>Link_Business_Function_Hier.required_ind, </cfif>Link_Business_Function_Hier.sort_order AS business_function_sort_order, Hierarchy_Structure.center_affiliation_ind,
	rownum AS sort_order
FROM REF_Hierarchy_Level
	INNER JOIN (
	<!--- $issue$: convert from Oracle-specific START WITH/CONNECT BY to Postgres recursive query --->
		SELECT CONNECT_BY_ROOT(Link_Program_Year_Hierarchy.hierarchy_level_id) AS root_hierarchy_level_id, Link_Program_Year_Hierarchy.hierarchy_level_id, SYS_CONNECT_BY_PATH(Link_Program_Year_Hierarchy.hierarchy_level_id,'/') AS path,
			Link_Program_Year_Hierarchy.l_p_y_h_id, level AS level_order, Link_Program_Year_Hierarchy.sort_order,
			center_affiliation_ind
		FROM Link_Program_Year_Hierarchy
		WHERE active_ind=1
		START WITH Link_Program_Year_Hierarchy.parent_hierarchy_level_id IS NULL
			AND active_ind=1
			AND program_year_id=#attributes.program_year_id#
		CONNECT BY PRIOR Link_Program_Year_Hierarchy.hierarchy_level_id=Link_Program_Year_Hierarchy.parent_hierarchy_level_id
			AND active_ind=1
			AND program_year_id=#attributes.program_year_id#
		ORDER BY level, l_p_y_h_id
	) Hierarchy_Structure ON REF_Hierarchy_Level.hierarchy_level_id=Hierarchy_Structure.hierarchy_level_id
	INNER JOIN (
		SELECT Link_Business_Function_Hier.l_p_y_h_id, <cfif attributes.consolidate_required_hierarchy_levels_ind EQ 0>Link_Business_Function_Hier.required_ind, Link_Business_Function_Hier.sort_order<cfelse>1</cfif> AS sort_order,
			REF_Screen.module_id
		FROM Link_Business_Function_Hier
			INNER JOIN REF_Screen ON Link_Business_Function_Hier.business_function_id=REF_Screen.business_function_id
		WHERE Link_Business_Function_Hier.active_ind=1
			AND REF_Screen.active_ind=1<cfif isdefined("attributes.module_id")>
			AND REF_Screen.module_id=#attributes.module_id#</cfif><cfif attributes.use_fuseaction_ind NEQ 0>
			AND REF_Screen.fuseaction='#attributes.fuseaction#'</cfif>
		GROUP BY Link_Business_Function_Hier.l_p_y_h_id<cfif attributes.consolidate_required_hierarchy_levels_ind EQ 0>, Link_Business_Function_Hier.required_ind, Link_Business_Function_Hier.sort_order</cfif>,
			REF_Screen.module_id
	) Link_Business_Function_Hier ON Hierarchy_Structure.l_p_y_h_id=Link_Business_Function_Hier.l_p_y_h_id
WHERE REF_Hierarchy_Level.active_ind=1<cfif attributes.exclude_center_ind EQ 1>
	AND REF_Hierarchy_Level.center_ind=0</cfif>
	AND <cfqueryparam value="#application.last_updated#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#application.last_updated#" cfsqltype="cf_sql_timestamp" />
</cfoutput>