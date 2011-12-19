<!-- Administration/act_clean_up_old_accounts.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_clean_up_old_accounts.cfm">
	<responsibilities>
		I expire accounts that are old enough to be deactivated.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/30/2007" role="FuseCoder" comments="Created File">
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


<cfif get_password_about_to_expire.recordcount GT 0>
	<!--- send email to the affected people --->
	<cfscript>
		attributes.email_recipients_demographics_id=valuelist(get_password_about_to_expire.demographics_id);
		attributes.reply_to=application.application_specific_settings.system_email_sender;
		attributes.subject="Your #application.product_name# password is getting old!";
		attributes.email_body="Your #application.product_name# password will expire in XYZ days. Please log on with username ABC to change your password at...";
		variables.created_by=0;
	</cfscript>
	<cfinclude template="../common_files/act_log_email.cfm">
	<cfoutput query="get_password_about_to_expire">
		<cfmail to="#get_password_about_to_expire.email_address#" from="#application.application_specific_settings.system_email_sender#" subject="#attributes.subject#" server="#application.email_server_name#" type="html">
Your #application.product_name# password will expire in #days_to_password_expire# days. Please log on with username #user_name# to change your password at <a href="#variables.url_to_application#">#variables.url_to_application#</a>
		</cfmail>
	</cfoutput>
</cfif>

<!--- User's passwords expire every 90 days --->
<cfinclude template="qry_get_expired_passwords.cfm">

<cfif get_expired_passwords.recordcount GT 0>
	<cfscript>
		attributes.email_recipients_demographics_id=valuelist(get_expired_passwords.demographics_id);
		attributes.reply_to=application.application_specific_settings.system_email_sender;
		attributes.subject="#application.product_name# Account Locked";
		attributes.email_body="Your #application.product_name# 'XYZ' account has been locked because your password has expired.<br />
Please contact the Help Desk at 202-358-HELP(4357) to re-activate your account if you still need access.";
		variables.created_by=0;
	</cfscript>
	<cfinclude template="../common_files/act_log_email.cfm">
	
	<!--- send email to the affected people --->
	<cfoutput query="get_expired_passwords">
		<cfmail to="#get_expired_passwords.email_address#" from="#application.application_specific_settings.system_email_sender#" subject="#application.product_name# Account Locked" server="#application.email_server_name#" type="html">
Your #application.product_name# '#get_expired_passwords.user_name#' account has been locked because your password has expired.<br />
Please contact the Help Desk at 202-358-HELP(4357) to re-activate your account if you still need access.
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


<cfoutput>Account clean-up process ran (#get_password_about_to_expire.recordcount# warnings, #get_expired_passwords.recordcount# expirations, #get_accounts_to_deactivate.recordcount# deactivations).<br /></cfoutput>
