<!-- Home/act_change_password.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_change_password.cfm">
	<responsibilities>
		I process the password supplied to be sure it meets standards (like it has not been used within the last ten times, entered password matches confirm password, etc.) when changing passwords.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<cfscript>
	if (NOT isdefined("attributes.account_status_id")) {
		attributes.account_status_id=0;
	}
	if (NOT isdefined("attributes.demographics_id")) {
		attributes.demographics_id=0;
	}
	if (NOT isdefined("attributes.old_password")) {
		attributes.old_password="";
	}
	if (NOT isdefined("attributes.user_name")) {
		attributes.user_name="";
	}
	if (NOT isdefined("variables.check_form_field")) {
		variables.check_form_field=0;
	}
</cfscript>

<!--- if the update user button is pressed run the code below --->
<!--- comment 1. this whole block has to do with checking if the string IS NOT NULL before proceeding --->
<cfset variables.password_accepted_ind=0>
<!--- check old password --->
<cfif NOT len(attributes.old_password)>
	<cfset variables.display_message="<li>Please enter current password</li>">
</cfif>
<!--- check new password --->
<cfif NOT len(attributes.password)>
	<cfset variables.display_message=variables.display_message & "<li>Please enter password</li>">
</cfif>
<!--- check confirm password --->
<cfif NOT len(attributes.confirm_password)>
	<cfset variables.display_message=variables.display_message & "<li>Please enter confirm password</li>">
</cfif>
<!--- end comment 1 --->

<!---comment 2. if it passes the first check (making sure nothing IS NULL then proceed to this block --->
<cfif len(variables.display_message) EQ 0>
	<cfinclude template="../common_files/act_validate_password_change.cfm">
</cfif>