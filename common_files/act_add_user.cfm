<!-- common_files/act_add_user.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_add_user.cfm">
	<responsibilities>
		I am responsible for processing the form that adds a user.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="5/31/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 6/29/9) Removed password logic, which is handled elsewhere.
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

<cfparam name="session.user_account_id" default="0">
<cfparam name="variables.add_user_error_count" default="0">

<!--- check if firstname field is empty --->
<cfif NOT len(attributes.first_name)>
	<cfset variables.display_message="Please enter first name.">
	<cfset variables.add_user_error_count=incrementvalue(variables.add_user_error_count)>
</cfif>
<!--- check to be sure lastname is not empty --->
<cfif NOT len(attributes.last_name)>
	<cfset variables.display_message="Please enter last name.">
	<cfset variables.add_user_error_count=incrementvalue(variables.add_user_error_count)>
</cfif>
<!--- check if username field is empty --->
<cfif NOT len(attributes.user_name)>
	<cfset variables.display_message="Please enter username.">
	<cfset variables.add_user_error_count=incrementvalue(variables.add_user_error_count)>
</cfif>
<!--- check email --->
<cfif NOT len(attributes.email_address)>
	<cfset variables.display_message="Please enter email address.">
	<cfset variables.add_user_error_count=incrementvalue(variables.add_user_error_count)>
</cfif>

<!--- check if the username already exist --->
<cfinclude template="qry_get_username.cfm">
<!--- if username exists, then tell the account manager to use another username --->
<cfif get_username.recordcount GT 0>
	<cfset variables.display_message="The username chosen already exists. Please <a href='javascript:administer_user_menu(#get_username.user_account_id#);'>administer the existing account</a>.">
	<cfset variables.add_user_error_count=incrementvalue(variables.add_user_error_count)>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="administer_user_menu" fuseaction="Administration.administer_user_menu" field_name="user_account_id">
</cfif>

<!--- if username and password fields are not empty, and username does not exist in the database then insert --->
<cfif variables.add_user_error_count EQ 0>
	<cftransaction>
		<!--- insert into user account table --->
		<cfinclude template="qry_insert_user_account.cfm">

		<!--- get the id of the inserted record because it will be needed to populate Demographics table --->
		<cfquery name="get_user_account_id" datasource="#application.datasources.main#">
		SELECT IDENT_CURRENT('User_Account') AS user_account_id
		</cfquery>
		<cfset attributes.user_account_id=get_user_account_id.user_account_id>

		<!--- set account as active --->
		<cfmodule template="qry_insert_link_user_account_status.cfm" user_account_id="#attributes.user_account_id#" account_status_id="1" created_by="#session.user_account_id#">

		<!--- insert demograpghics info --->
		<cfinclude template="qry_insert_demographics.cfm">

		<cfset variables.reset_password_value="#left(ucase(attributes.first_name),1)##left(lcase(attributes.last_name),3)##year(now())##attributes.user_account_id#">
		<!--- get random string from encryption --->
		<cfmodule template="act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#variables.reset_password_value#" user_account_id="#attributes.user_account_id#">

		<!--- prefix with A1* to ensure password meets 2810 standards --->
		<cfset variables.reset_password_value="A1*#variables.encrypted_password#">

		<!--- encrypt the password --->
		<cfmodule template="act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#variables.reset_password_value#" user_account_id="#attributes.user_account_id#">

		<!--- deactivate old user_password record --->
		<cfinclude template="qry_deactivate_user_password.cfm">

		<!--- create new user_password record --->
		<cfinclude template="qry_insert_user_password.cfm">

		<!--- give default access --->
		<cfset attributes.user_category="add_user">
		<cfinclude template="qry_insert_access_user_business_function.cfm">
	</cftransaction>

	<!--- send email to the added user--->
	<cfif len(attributes.email_address)>
		<cfmail to="#attributes.email_address#" from="#application.application_specific_settings.system_email_sender#" server="#application.email_server_name#" subject="#application.product_name# Account Creation (1 of 2)">
Your #application.product_name# account has been created, welcome to the system. Your username is "#attributes.user_name#". Your initial password will be sent to you in a separate email. Once your password arrives, you can access #application.product_name# at <a href="#listfirst(cgi.http_referer,"?")#">#listfirst(cgi.http_referer,"?")#</a>.
		</cfmail>
		<cfmail to="#attributes.email_address#" from="#application.application_specific_settings.system_email_sender#" server="#application.email_server_name#" subject="#application.product_name# Account Creation (2 of 2)">
Your #application.product_name# account has been created, welcome to the system. Your username was sent to you in a previous email. Your initial password is 

"#variables.reset_password_value#"

-- this password is case-sensitive, so please type it exactly as it appears between the quote marks. The system will require you to change your password after your next login.

You can access #application.product_name# at #listfirst(cgi.http_referer,"?")#.
		</cfmail>
	<cfelse>
		<br />The new user does not have an email address so the system cannot send the user his/her password.
	</cfif>
	<cfset attributes.last_name="">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_navigation_access" fuseaction="Administration.edit_navigation_access" field_name="user_account_id" processform="1" program_year_id="1" method="Select">
	<cfset variables.display_message="A new user has been added. You may <a href='javascript:edit_navigation_access(#attributes.user_account_id#);'>edit this user's access</a> now, or in the future by clicking on the Administration > Manage Users > Administer User Access navigation link.">
</cfif>