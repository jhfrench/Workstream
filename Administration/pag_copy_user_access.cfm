<!-- Administration/pag_copy_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_copy_user_access.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/14/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.method" default="">
<cfparam name="attributes.display_message" default="">
<cfparam name="attributes.source_user_account_id" default="0">

<cfif isdefined("attributes.target_user_account_id")>
	<cfinclude template="act_copy_user_access.cfm">
	The access has been copied.
<cfelse>
	<cfif attributes.source_user_account_id NEQ 0>
		<cfset variables.form_element_type="checkbox">
		<cfset variables.form_element_label="target_user_account_id">
		<cfset variables.submit_label="Apply access to these users">
	<cfelse>
		<cfset variables.form_element_type="radio">
		<cfset variables.form_element_label="source_user_account_id">
		<cfset variables.submit_label="Copy User">
	</cfif>
	<cfparam name="attributes.account_status_id" default="1">
	<cfparam name="attributes.last_initial" default="">
	
	<cfmodule template="../common_files/qry_get_ref_account_status.cfm">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="alphabet_navigation" fuseaction="Administration.copy_user_access" field_name="last_initial" field_value="" processform="1" source_user_account_id="#attributes.source_user_account_id#" account_status_id="#attributes.account_status_id#">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="status_filter" fuseaction="Administration.copy_user_access" field_name="account_status_id" field_value="" processform="1" source_user_account_id="#attributes.source_user_account_id#" last_initial="#attributes.last_initial#">
	
	<!--- include all user query --->
	<cfinclude template="../common_files/qry_get_user_information.cfm">
	
	<cfinclude template="dsp_copy_user_access.cfm">
</cfif>