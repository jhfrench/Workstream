<!-- common_files/act_edit_password.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_password.cfm">
	<responsibilities>
		I process password that has been changed by a user.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="variables.check_form_field" default="0">
<!--- updating password --->
<!--- encrypt the password and return the encrypted value --->
<cfmodule template="act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#attributes.password#" user_account_id="#attributes.user_account_id#">
<cfset attributes.password="A1*#variables.encrypted_password#">
<cfmodule template="act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#attributes.password#" user_account_id="#attributes.user_account_id#">

<!--- deactivate old user_password record --->
<cfinclude template="../common_files/qry_deactivate_user_password.cfm">
<!--- create new user_password record --->
<cfinclude template="../common_files/qry_insert_user_password.cfm">

<!--- get the user information needed to populate the edit form. --->
<cfinclude template="../common_files/qry_get_user_information.cfm">

<cfif get_user_information.recordcount EQ 1 AND len(get_user_information.email_address)>
	<cfset variables.url_to_application="https://#cgi.http_host##cgi.script_name#">
	<cfmail to="#get_user_information.email_address#" from="#application.application_specific_settings.system_email_sender#" subject="#application.product_name# Password Reset" server="#application.email_server_name#" type="html">
<p>Your #application.product_name# password has been set to:
	<ul>#attributes.password#</ul>
</p>

<p>Please cut-and-paste the above text into the password field on the #application.product_name# login screen.<br />
As a security feature, #application.product_name# will require you to change your password after you log in. You may log in at <a href="#variables.url_to_application#">#variables.url_to_application#</a></p>
<p>Please contact the Help Desk<!--- $issue$: contact info   at 202-358-HELP(4357)---> if you did not request your password to be reset.</p>
	</cfmail>
</cfif>