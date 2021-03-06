<!-- Home/act_login.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_login.cfm">
	<responsibilities>
		I authenticate users logging in.
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
<!--- assume that the user will not get in --->
<cfset variables.success_ind=0>

<!--- USE STRUCTDELETE TO DESTROY INDIVIDUAL SESSION VARS --->
<cfloop collection="#session#" item="variables.session_variable_ii">
	<cfset structdelete(session, variables.session_variable_ii)>
</cfloop>

<!--- get the username provided to check if it exists --->
<cfinclude template="qry_get_username.cfm">
<!--- encrypt the incoming password --->
<cfmodule template="../common_files/act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#attributes.password#" user_account_id="#get_username.user_account_id#" password_created_date="#get_username.password_created_date#">

<!--- helps create initial account
<cfquery name="get_username" datasource="#application.datasources.main#">
UPDATE User_Password
SET active_ind=0
</cfquery>
<cfquery name="get_username" datasource="#application.datasources.main#">
INSERT INTO User_Password (user_account_id, password)
VALUES (1, '#variables.encrypted_password#')
</cfquery>
<cfinclude template="qry_get_username.cfm">
 --->

<!--- valid username supplied --->
<cfif get_username.recordcount EQ 1>
	<!--- if user is active --->
	<cfif get_username.account_status_id EQ 1>
		<!--- If username and password are correct --->
		<cfif NOT compare(variables.encrypted_password,get_username.password)>
			<cfscript>
				session.user_account_id=get_username.user_account_id;
				session.user_name=attributes.user_name;
				session.last_name=get_username.last_name;
				session.first_name=get_username.first_name;
				session.email_address=get_username.email_address;
				session.password_created_by=get_username.password_created_by;
				variables.user_identification=get_username.user_account_id;
			</cfscript>

			<!--- $issue$ next two files should be consolidated --->
			<cfinclude template="../common_files/act_load_profile.cfm">
			<cfinclude template="../common_files/qry_get_user_preferences.cfm">
			
			<!--- If known, send the user to the page they originally requested (unless the page they requested is "Application_Manager.login", it makes no sense to "send" them to the login page once they've logged in) --->
			<cfif len(attributes.requested_page) AND NOT listfind("Application_Manager.login,Help.view_help_article,Help.view_help_faq", attributes.requested_page)>
				<cfset variables.redirect_destination="#attributes.requested_page#">
			<cfelse>
				<cfset variables.redirect_destination="#application.fusebox.defaultfuseaction#">
			</cfif>
			<!--- if the person that created the password is not the user, then let the user change his/her password --->
			<cfif get_username.password_created_by NEQ get_username.user_account_id>
				<cfset variables.redirect_destination="Home.change_password&user_account_id=#get_username.user_account_id#&requested_page=#variables.redirect_destination#">
			</cfif>
			
			<cfset variables.success_ind=1>
		<!--- if user is not active --->
		<cfelse>
			<!--- Log the user as unsuccessful attempt --->
			<cfset variables.display_message="#application.product_name# cannot authorize your access because your username/password combination is not correct.1">
		</cfif>
	<!--- if user is not active --->
	<cfelse>
		<cfset variables.display_message="#application.product_name# cannot authorize your access because your username/password combination is not correct.2">
	</cfif>
<!--- if account does not exist --->
<cfelse>
	<cfset variables.display_message="#application.product_name# cannot authorize your access because your username/password combination is not correct.3">
</cfif>

<!--- keep track of login attempt --->
<cfmodule template="qry_insert_login_attempt.cfm" user_name="#attributes.user_name#" password="#variables.encrypted_password#" success_ind="#variables.success_ind#">

<cfif variables.success_ind EQ 1>
	<!--- the user got in --->
	<cflocation url="index.cfm?fuseaction=#variables.redirect_destination#" addtoken="no">
<cfelse>
	<!--- the user did not get in; get number of invalid login attempts since last valid login for given username --->
	<cfinclude template="qry_get_login_attempt.cfm">

	<cfif get_login_attempt.recordcount GT 4 AND get_username.recordcount EQ 1>
		<!--- <cfset variables.display_message="The system has locked the '#attributes.user_name#' account. #variables.display_message#"> --->
		<cfif get_login_attempt.recordcount EQ 5>
			<cfset attributes.user_account_id=get_username.user_account_id>
			<cfinclude template="../common_files/qry_deactivate_user_account_status.cfm">
			<cfinclude template="../common_files/qry_insert_link_user_account_status.cfm">
		</cfif>
		<cfmail to="#get_username.email_address#" from="#application.system_email_sender#" subject="#application.product_name# Account Locked" type="HTML"
			server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
			port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
Your #application.product_name# '#attributes.user_name#' account has been locked.

Please contact your #application.product_name# administrator to re-activate your account or if you did not attempt to sign in.
		</cfmail>
	</cfif>
</cfif>
