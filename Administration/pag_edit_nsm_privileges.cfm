<!-- Administration/pag_edit_nsm_privileges.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_nsm_privileges.cfm">
	<responsibilities>
		I help the user assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.nsm_drilldown_organizations" default="0">
<cfparam name="attributes.hierarchy_level" default="1">
<cfif attributes.nsm_drilldown_organizations NEQ 0>
	<cfset attributes.organization_id=attributes.nsm_drilldown_organizations>
</cfif>

<!--- The breadcrumbs supply the l_p_y_h_id of the organization being passed in, but the edit_nsm_privileges function is expecting the *next* l_p_y_h_id. $issue$: should change those 'l_p_y_h_id' references to be 'next_l_p_y_h_id' to make this more clear. Doing following instead, for now:
<cfif isdefined("attributes.breadcrumb_ind")>
	<!--- get user information --->
	<cfquery name="get_next_l_p_y_h_id" datasource="#application.datasources.main#">
	SELECT MIN(Hierarchy_Assignment.l_p_y_h_id) AS l_p_y_h_id, MIN(Link_Program_Year_Hierarchy.hierarchy_level_id) AS hierarchy_level
	FROM Hierarchy_Assignment
		INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
	WHERE Hierarchy_Assignment.active_ind=1
		AND Link_Program_Year_Hierarchy.active_ind=1
		AND Hierarchy_Assignment.parent_organization_id=#attributes.organization_id#
		AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
	</cfquery>
	<cfset attributes.l_p_y_h_id=get_next_l_p_y_h_id.l_p_y_h_id>
	<cfset attributes.hierarchy_level=get_next_l_p_y_h_id.hierarchy_level>
<!--- if we submitted NSM access assignments data to this page, process those assignments --->
<cfelseif isdefined("attributes.insert_ind")>
	<!--- get module meta data to set up access insert and select queries --->
	<cfinclude template="../common_files/qry_get_module_privilege_details.cfm">
	<!--- deactivate old assignments --->
	<cfinclude template="act_deactivate_access_user_account_grouper.cfm">
	<!--- enter new assignments --->
	<cfinclude template="act_insert_access_user_account_grouper.cfm">
</cfif> --->

<cfif isdefined("attributes.insert_ind")>
	<!--- get module meta data to set up access insert and select queries --->
	<cfinclude template="../common_files/qry_get_module_privilege_details.cfm">
	<!--- deactivate old assignments --->
	<cfinclude template="act_deactivate_access_user_account_grouper.cfm">
	<!--- enter new assignments --->
	<cfinclude template="act_insert_access_user_account_grouper.cfm">
</cfif>

<!--- get year description --->
<cfmodule template="../common_files/qry_get_program_year.cfm" exclude_future_years_ind="0" program_year_id="#attributes.program_year_id#">

<!--- get user name --->
<cfinclude template="../common_files/qry_get_user_information.cfm">

<!--- get grouper meta data to set up next query --->
<cfset attributes.consolidate_required_hierarchy_levels_ind=1>
<cfinclude template="../common_files/qry_get_business_function_hierarchy.cfm">

<cfif get_business_function_hierarchy.recordcount NEQ 0>
	<cfinclude template="../common_files/act_hierarchy_drilldown_options.cfm">

	<!--- get module meta data to set up access insert and select queries --->
	<cfinclude template="act_set_exclude_privilege_id.cfm">
	<cfinclude template="../common_files/qry_get_module_privilege_details.cfm">

	<!--- get module name --->
	<cfinclude template="../common_files/qry_get_ref_module.cfm">


	<!--- get NSM values for specified NSM grouper --->
	<cfinclude template="../common_files/qry_get_grouper_options_and_user_privileges.cfm">

	<!--- This is the hidden form that helps the user drill-down to the children NSM entities --->
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_nsm_privileges" fuseaction="Administration.edit_nsm_privileges" processform="1" no_reset="l_p_y_h_id" field_name="nsm_drilldown_organizations" user_account_id="#attributes.user_account_id#" module_id="#attributes.module_id#" l_p_y_h_id="#variables.next_l_p_y_h_id#" hierarchy_level="#incrementvalue(attributes.hierarchy_level)#" program_year_id="#attributes.program_year_id#">
	<cfinclude template="dsp_edit_nsm_privileges.cfm">
</cfif>