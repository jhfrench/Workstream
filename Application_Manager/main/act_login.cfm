<!-- Home/act_login.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_login.cfm">
	<responsibilities>
		I authenticate users logging in.
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
<!--- assume that the user will not get in --->
<cfset variables.success_ind=0>

<!--- use structdelete to destroy individual session vars --->
<cfloop collection="#session#" item="session_variable_ii">
	<cfset structdelete(session, session_variable_ii)>
</cfloop>

<!--- get the username provided to check if it exists --->
<cfinclude template="qry_get_username.cfm">
<!--- encrypt the password --->
<cfmodule template="../common_files/act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#attributes.password#" user_account_id="#get_username.user_account_id#" password_created_date="#get_username.password_created_date#">

<!--- valid username supplied --->
<cfif get_username.recordcount EQ 1>
	<!--- if user is active --->
	<cfif get_username.account_status_id EQ 1>
		<!--- If username and password are correct --->
		<cfif NOT compare(variables.encrypted_password,get_username.password)>
			<cfset session.user_account_id=get_username.user_account_id>
			<cfset session.user_name=attributes.user_name>
			<cfset session.last_name=get_username.last_name>
			<cfset session.first_name=get_username.first_name>
			<cfset session.email_address=get_username.email_address>
			<cfset session.password_created_by=get_username.password_created_by>

			<!--- If known, send the user to the page they originally requested (unless the page they requested is "Application_Manager.login", it makes no sense to "send" them to the login page once they've logged in) --->
			<cfif len(attributes.requested_page) AND NOT listfind("Application_Manager.login,Application_Manager.forum_commands,Help.view_help_article,Application_Manager.module_commands", attributes.requested_page)>
				<cfset variables.redirect_destination="fuseaction=#attributes.requested_page#">
			<cfelse>
				<cfset variables.redirect_destination="fuseaction=main.welcome">
			</cfif>
			<!--- if the person that created the password is not the user, then let the user change his/her password --->
			<cfif session.password_created_by NEQ session.user_account_id>
				<cfset variables.redirect_destination="fuseaction=Application_Manager.change_password&user_account_id=#get_username.user_account_id#&requested_page=#variables.redirect_destination#">
			</cfif>
			<cfset variables.success_ind=1>
		<!--- if user is not active --->
		<cfelse>
			<!--- Log the user as unsuccessful attempt --->
			<cfset variables.display_message="Application_Manager cannot authorize your access because your username/password combination is not correct.">
		</cfif>
	<!--- if user is not active --->
	<cfelse>
		<cfset variables.display_message="Your account is not active/or has been locked. Please contact the administrator of this system.">
	</cfif>
<!--- if account does not exist --->
<cfelse>
	<cfset variables.display_message="Application_Manager cannot authorize your access because your username/password combination is not correct.">
</cfif>

<!--- keep track of login attempt --->
<cfmodule template="qry_insert_login_attempt.cfm" user_name="#attributes.user_name#" password="#variables.encrypted_password#" success_ind="#variables.success_ind#">

<cfif variables.success_ind EQ 1>
	<!--- the user got in --->
	<cflocation url="index.cfm?#variables.redirect_destination#" addtoken="no">
<cfelse>
	<!--- the user did not get in; get number of invalid login attempts since last valid login for given username --->
	<cfinclude template="qry_get_login_attempt.cfm">
	<cfif get_login_attempt.recordcount EQ 4 AND get_username.recordcount EQ 1>
		<cfset variables.display_message="The system has locked the '#attributes.user_name#' account. #variables.display_message#">
		<cfset attributes.user_account_id=get_username.user_account_id>
		<cfinclude template="../common_files/qry_deactivate_user_account_status.cfm">
		<cfinclude template="../common_files/qry_insert_link_user_account_status.cfm">
		<cfmail to="#get_username.email_address#" from="#application.application_specific_settings.system_email_sender#" subject="Application_Manager Account Locked" server="#application.email_server_name#">
		Your Application_Manager account has been locked. Please contact the administrator of this system to activate your account.
		</cfmail>
	</cfif>
</cfif>
