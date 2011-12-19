<!-- Administration/pag_edit_ref_screen.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_screen.cfm">
	<responsibilities>
		I display the form for editing screens and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/15/2007" role="FuseCoder" comments="Created File">
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

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.relocate")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_screen.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_screen.cfm">
	<!--- update all the tables that used to link to the old REF_Screen record --->
	<cfinclude template="qry_update_link_screen_help_article.cfm">
	<cfinclude template="qry_update_link_screen_comments.cfm">
	<cfinclude template="qry_update_link_screen_requirement.cfm">
	<!--- reorder records based on fuseaction; nav is ordered by REF_Module.sort_order than REF_Business_Function.sort_order, so REF_Screen.sort_order doesn't show to most users --->
	<cfmodule template="../common_files/act_administer_sorter_table.cfm" table_to_sort="REF_Screen" id_of_sorted_column="screen_id" text_of_sorted_column="fuseaction" order_by="fuseaction">
</cfif>

<cfparam name="attributes.fuseaction" default="">
<cfparam name="attributes.module_id" default="0">
<cfparam name="attributes.business_function_id" default="0">
<cfparam name="attributes.screen_id" default="0">
<cfparam name="attributes.check_variable" default="">
<cfparam name="attributes.relocate" default="">
<cfparam name="attributes.active_ind" default="0">
<cfparam name="attributes.starting_point_ind" default="0">
<cfparam name="attributes.body_onload" default="0">

<cfinclude template="../common_files/qry_get_ref_module.cfm">
<cfset attributes.sort_order="description">
<cfinclude template="qry_get_business_function.cfm">

<!--- this query retrieves values for a specific screen_id --->
<cfinclude template="qry_get_ref_screen.cfm">
<cfif get_ref_screen.recordcount>
	<!--- fuseaction is a reserved word in fuseboxed apps, so use 'new_fuseaction' instead --->
	<cfset attributes.new_fuseaction=get_ref_screen.fuseaction>
	<cfset attributes.business_function_id=get_ref_screen.business_function_id>
	<cfset attributes.module_id=get_ref_screen.module_id>
	<cfset attributes.check_variable=get_ref_screen.check_variable>
	<cfset attributes.relocate=get_ref_screen.relocate>
	<cfset attributes.active_ind=get_ref_screen.active_ind>
	<cfset attributes.starting_point_ind=get_ref_screen.starting_point_ind>
	<cfset attributes.body_onload=get_ref_screen.body_onload>
</cfif>

<!--- this query retrieves the values for all the drop-downs --->
<cfmodule template="qry_get_ref_screen.cfm" show_all_ind="1">

<cfinclude template="dsp_edit_ref_screen.cfm">
			