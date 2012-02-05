<!-- Administration/act_administer_user_menu.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_administer_user_menu.cfm">
	<responsibilities>
		I send information to DB for editing user information and reset user password when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<!--- this is for updateing the edit form --->
<cfif NOT comparenocase(attributes.method,"Update Information")>
	<!--- handle demographics changes --->
	<cfinclude template="../common_files/qry_deactivate_demographics.cfm">
	<cfinclude template="../common_files/qry_insert_demographics.cfm">
	<!--- handle account status change --->
	<cfinclude template="../common_files/qry_deactivate_user_account_status.cfm">
	<cfset attributes.created_by=session.user_account_id>
	<cfinclude template="../common_files/qry_insert_link_user_account_status.cfm">
	<cfset attributes.display_message="User information was successfully updated.">
</cfif>

<cfinclude template="../common_files/qry_get_user_information.cfm">
<cfinclude template="../common_files/qry_get_user_password.cfm">

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="reset_password" fuseaction="Administration.reset_password" field_name="user_account_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_navigation_access" fuseaction="Administration.edit_navigation_access" field_name="user_account_id" field2_name="program_year_id" field2_value="#session.program_year_id#" processform="1" method="Select">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_user_activity" fuseaction="Administration.view_user_activity" field_name="user_account_id" field_value="">
