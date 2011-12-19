<!-- Home/act_change_password.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_change_password.cfm">
	<responsibilities>
		I process the password supplied to be sure it meets standards (like it has not been used within the last ten times, entered password matches confirm password, etc.) when changing passwords.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<!--- if the update user button is pressed run the code below --->
<!--- comment 1. this whole block has to do with checking if the string is not null before proceeding --->
<cfset variables.password_accepted_ind=0>
<!--- check old password --->
<cfif NOT len(attributes.old_password)>
	<cfset variables.display_message="<li>Please enter current password">
</cfif>
<!--- check new password --->
<cfif NOT len(attributes.password)>
	<cfset variables.display_message=variables.display_message & "<li>Please enter password">
</cfif>
<!--- check confirm password --->
<cfif NOT len(attributes.confirm_password)>
	<cfset variables.display_message=variables.display_message & "<li>Please enter confirm password">
</cfif>
<!--- end comment 1 --->

<!---comment 2. if it passes the first check (making sure nothing is null then proceed to this block --->
<cfif len(variables.display_message) EQ 0>
	<cfinclude template="../common_files/act_validate_password_change.cfm">
</cfif>