<!-- common_files/act_hierarchy_drilldown_options.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_hierarchy_drilldown_options.cfm">
	<responsibilities>
		I process hierarchy drilldown options.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/23/2007" role="FuseCoder" comments="Created File">
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
<cfif isdefined("attributes.original_l_p_y_h_id")>
	<cfset attributes.l_p_y_h_id=attributes.original_l_p_y_h_id>
</cfif>

<cfif NOT isdefined("attributes.organization_id")>
	<cfset attributes.l_p_y_h_id=get_business_function_hierarchy.l_p_y_h_id>
	<cfquery name="get_default_parents" datasource="#application.datasources.main#">
	SELECT organization_id
	FROM Hierarchy_Assignment
	WHERE active_ind=1
		AND l_p_y_h_id=#attributes.l_p_y_h_id#
	</cfquery>
	<cfset attributes.organization_id=valuelist(get_default_parents.organization_id)>
</cfif>

<cfset variables.hierarchy_level_label_list=valuelist(get_business_function_hierarchy.hierarchy_level_label)>
<cfset variables.l_p_y_h_id_list=valuelist(get_business_function_hierarchy.l_p_y_h_id)>
<cfset variables.current_hierarchy_level_position=listfind(variables.l_p_y_h_id_list, attributes.l_p_y_h_id)>
<cfset attributes.center_ind=listgetat(valuelist(get_business_function_hierarchy.center_ind),variables.current_hierarchy_level_position)>

<!--- Set the current hierarchy label --->
<cfset variables.current_hierarchy_level_label=listgetat(variables.hierarchy_level_label_list, variables.current_hierarchy_level_position)>

<!--- Set the next hierarchy label and id --->
<cfset variables.next_hierarchy_level_position=incrementvalue(variables.current_hierarchy_level_position)>
<cfif listlen(variables.l_p_y_h_id_list) LT variables.next_hierarchy_level_position>
	<cfset variables.next_hierarchy_level_label="">
	<cfset variables.next_l_p_y_h_id=0>
	<cfset variables.next_hierarchy_level=0>
<cfelse>
	<cfset variables.next_hierarchy_level=listgetat(valuelist(get_business_function_hierarchy.program_year_sort_order), variables.next_hierarchy_level_position)>
</cfif>

<cfinclude template="../common_files/qry_get_next_hierarchy_drilldown_options.cfm">

<cfif get_next_hierarchy_drilldown_options.recordcount EQ 1>
	<cfset variables.next_hierarchy_level_label=get_next_hierarchy_drilldown_options.hierarchy_level_label>
	<cfset variables.next_l_p_y_h_id=get_next_hierarchy_drilldown_options.l_p_y_h_id>
<cfelseif get_next_hierarchy_drilldown_options.recordcount GT 1>
	<cfset variables.next_hierarchy_level_label="">
	<cfset variables.next_l_p_y_h_id=get_next_hierarchy_drilldown_options.l_p_y_h_id>
<cfelse>
	<cfset variables.next_l_p_y_h_id=0>
</cfif>