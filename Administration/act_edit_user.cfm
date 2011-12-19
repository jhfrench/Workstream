<!-- Administration/act_edit_user.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_user.cfm">
	<responsibilities>
		I display the form for editing user and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.user_name" default="">
<cfparam name="attributes.password" default="">
<cfparam name="attributes.demographics_id" default="0">
<cfparam name="attributes.account_status_id" default="0">
<cfparam name="variables.display_message" default="">
<cfparam name="variables.check_form_field" default=0>
<cfparam name="attributes.action" default="edit_user">
<cfparam name="attributes.method" default="">
<cfparam name="attributes.confirm_password" default="">
<cfparam name="attributes.old_password" default="">
<cfparam name="attributes.user_account_id" default="0">

<!--- if the update user button is pressed run the code below --->
<cfif NOT comparenocase(attributes.method,"Update User")>
	<cfif attributes.account_status_id NEQ 0>
	<!--- lock the account --->
		<cfinclude template="../common_files/qry_deactivate_user_account_status.cfm">
		<cfset attributes.created_by=session.user_account_id>
		<cfinclude template="../common_files/qry_insert_link_user_account_status.cfm">
		<cfif attributes.account_status_id EQ 2>
			<cflocation url="index.cfm?fuseaction=#application.fusebox.defaultfuseaction#&display_message=User information has been locked ">
		</cfif>
	<!--- modify password --->
	<cfelse>
		<cfinclude template="../common_files/act_validate_password_change.cfm">
	</cfif>
</cfif>

<!--- get the user information needed to populate the edit form. --->
<cfinclude template="../common_files/qry_get_user_information.cfm">
