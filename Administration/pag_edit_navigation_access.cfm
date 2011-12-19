<!-- Administration/pag_edit_navigation_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_navigation_access.cfm">
	<responsibilities>
		Help the user maintain navigation access.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="application.application_specific_settings.assign_module_access_ind" default="0">

<cfif isdefined("attributes.access_administration_type")>
	<cfinclude template="qry_deactivate_access_user_business_function.cfm">
	<cfinclude template="../common_files/qry_insert_access_user_business_function.cfm">
</cfif>

<cfinclude template="../common_files/qry_get_user_information.cfm">
<cfset variables.module_description="thiswill_never_match_jf">

<cfif application.application_specific_settings.assign_module_access_ind EQ 1>
	<cfmodule template="../common_files/qry_get_ref_module.cfm" module_id="0" show_viewable_only_ind="0">
	<cfinclude template="../common_files/qry_get_user_module_access.cfm">
	<cfinclude template="dsp_edit_module_access.cfm">
<cfelse>

	<cfif isdefined("attributes.relevant_business_function_id") AND len(attributes.relevant_business_function_id)>
		<cfinclude template="qry_deactivate_access_user_business_function.cfm">
		<cfif len(attributes.business_function_id)>
			<cfinclude template="../common_files/qry_insert_access_user_business_function.cfm">
		</cfif>
	</cfif>
	<cfinclude template="../common_files/qry_get_user_navigation_access.cfm">
	<cfset variables.assigned_module_id=valuelist(get_user_navigation_access.accessible_module_id)>
	
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_nsm_privileges" fuseaction="Administration.edit_nsm_privileges" field_name="module_id" field_value="" processform="1" field2_name="user_account_id" field2_value="#attributes.user_account_id#" program_year_id="#attributes.program_year_id#">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_access" fuseaction="Administration.view_user_access" field_name="user_account_id" field_value="" field2_name="program_year_id" field2_value="#attributes.program_year_id#">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="administer_user_menu" fuseaction="Administration.administer_user_menu" field_name="user_account_id" field_value="">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_activity" fuseaction="Administration.view_user_activity" field_name="user_account_id" field_value="">
	
	<cfinclude template="dsp_edit_navigation_access.cfm">
</cfif>