<!-- common_files/act_process_password.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_process_password.cfm">
	<responsibilities>
		I compare passwords to be sure old password is not same as new password when a user is changing password, then check if it meets 2810 requirements before allawing a change.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/6/7) Changed template name.
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

<!--- check if the new password is the same as the old password --->
<cfif NOT compare(attributes.password,attributes.old_password)>
	<cfset variables.password_accepted_ind=0>
	<cfset variables.display_message="<li>Your old and new password supplied cannot be the same. You have to change the new password.</li>">

<!--- check if the new password matches the confirmation --->
<cfelseif compare(attributes.password, attributes.confirm_password)>
	<cfset variables.password_accepted_ind=0>
	<cfset variables.display_message="<li>The value you entered in new passwords and confirm password fields are not the same. Please make sure they are the same to proceed.</li>">

<!--- confirmations checked out, now let's further evaluate for 2810 --->
<cfelse>
	<!--- check if password meets 2810 requirement --->
	<cfmodule template="act_check_password.cfm" user_account_id="#attributes.user_account_id#" password="#attributes.password#" encrypted_password="#variables.encrypted_password#">
	
	<!--- if it meets 2810 requirement, then allow an update --->
	<cfif variables.password_accepted_ind EQ 1>
		<!--- deactivate old user_password record --->
		<cfinclude template="qry_deactivate_user_password.cfm">
		<!--- create new user_password record --->
		<cfinclude template="qry_insert_user_password.cfm">
		<cfset session.password_created_by=variables.user_identification>
		<cfif attributes.user_account_id NEQ variables.user_identification>
			<cfset variables.display_message="<li>The user's password has been succesfully changed. The new password is only temporary; #application.product_name# will require the user to change their password the next time they sign in.</li>">
		<cfelse>
			<cfset variables.display_message="<li>Your password has been succesfully changed.</li>">
		</cfif>
	</cfif>
</cfif>