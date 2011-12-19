<!-- Administration/pag_manage_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_user_access.cfm">
	<responsibilities>
		Page to help administrator to manage user access.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/30/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.account_status_id" default="1">
<cfparam name="attributes.last_initial" default="">

<cfmodule template="../common_files/qry_get_ref_account_status.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="alphabet_navigation" fuseaction="Administration.manage_user_access" field_name="last_initial" field_value="" field2_name="account_status_id" field2_value="#attributes.account_status_id#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="status_filter" fuseaction="Administration.manage_user_access" field_name="account_status_id" field_value="" field2_name="last_initial" field2_value="#attributes.last_initial#">

<!--- include all user query --->
<cfinclude template="../common_files/qry_get_user_information.cfm">
<cfinclude template="dsp_manage_user_access.cfm">