<!-- Administration/pag_manage_user_profiles.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_user_profiles.cfm">
	<responsibilities>
		Page to help administrator to manage user profiles.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/30/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="administer_user_menu" fuseaction="Administration.administer_user_menu" field_name="user_account_id">
<!--- include all user query --->
<cfinclude template="../common_files/qry_get_user_information.cfm">
<cfinclude template="dsp_manage_user_profiles.cfm">
