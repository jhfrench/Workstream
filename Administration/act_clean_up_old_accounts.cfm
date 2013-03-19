<!-- Administration/act_clean_up_old_accounts.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_clean_up_old_accounts.cfm">
	<responsibilities>
		I expire accounts that are old enough to be deactivated.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/30/2007" role="FuseCoder" comments="Created File">
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

<cfset variables.url_to_application="https://#cgi.http_host##cgi.script_name#?fuseaction=Home.change_password">

<!--- User shall be notified by email 30, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, AND 1 days prior to expiration of the password. --->
<!--- get the query that gets the records for the password expiring --->
<cfinclude template="qry_get_password_about_to_expire.cfm">

<!--- send email to the affected people --->
<cfoutput>
<cfloop query="get_password_about_to_expire">
	<cfmail to="#get_password_about_to_expire.email_address#" from="#application.system_email_sender#" subject="Your #application.product_name# password is getting old!" type="HTML"
		server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
		port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
	Your #application.product_name# password will expire in #days_to_password_expire# days. Please log on with username #user_name# to change your password at <a href="#variables.url_to_application#">#variables.url_to_application#</a>
	</cfmail>
</cfloop>
</cfoutput>

<!--- User's passwords expire every 90 days --->
<cfinclude template="qry_get_expired_passwords.cfm">

<cfif get_expired_passwords.recordcount GT 0>
	<!--- send email to the affected people --->
	<cfoutput query="get_expired_passwords">
		<cfmail to="#get_expired_passwords.email_address#" from="#application.system_email_sender#" subject="#application.product_name# Account Locked" type="HTML"
			server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
			port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
Your #application.product_name# '#get_expired_passwords.user_name#' account has been locked because your password has expired.<br />
Please contact your #application.product_name# administrator to re-activate your account if you still need access.
		</cfmail>
	</cfoutput>

	<cfquery name="insert_link_user_account_status" datasource="#application.datasources.main#">
	UPDATE Link_User_Account_Status
	SET active_ind=0
	WHERE active_ind=1
		AND user_account_id IN (#valuelist(get_expired_passwords.user_account_id)#)
	</cfquery>

	<cfquery name="insert_link_user_account_status" datasource="#application.datasources.main#">
	/*Lock these accounts*/
	INSERT INTO Link_User_Account_Status (user_account_id, account_status_id, created_by)
	SELECT user_account_id, 2, 1
	FROM User_Account
	WHERE user_account_id IN (#valuelist(get_expired_passwords.user_account_id)#)
	</cfquery>
</cfif>

<!--- at 180 days deactivate the account --->
<cfinclude template="qry_get_accounts_to_deactivate.cfm">

<cfif get_accounts_to_deactivate.recordcount GT 0>
	<cfquery name="insert_link_user_account_status" datasource="#application.datasources.main#">
	UPDATE Link_User_Account_Status
	SET active_ind=0
	WHERE active_ind=1
		AND user_account_id IN (#valuelist(get_accounts_to_deactivate.user_account_id)#)
	</cfquery>

	<cfquery name="insert_link_user_account_status" datasource="#application.datasources.main#">
	/*Deactivate these accounts*/
	INSERT INTO Link_User_Account_Status (user_account_id, account_status_id, created_by)
	SELECT user_account_id, 3, 1
	FROM User_Account
	WHERE user_account_id IN (#valuelist(get_accounts_to_deactivate.user_account_id)#)
	</cfquery>
</cfif>
