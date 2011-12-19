<!-- Home/act_forget_username.cfm
	Author: Alicia McPherson-->

<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_forget_username.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="alicia.mcpherson@nasa.gov" author="Alicia McPherson" type="create" date="7/10/2010" role="FuseCoder" comments="Created File">
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

<cfinclude template="qry_get_username.cfm">
<cfif get_username.recordcount>
	<cfscript>
		attributes.user_account_id=get_username.user_account_id;
		attributes.email_recipients_demographics_id=get_username.demographics_id;
		attributes.reply_to=application.application_specific_settings.system_email_sender;
		attributes.subject="#application.product_name# Username";
		attributes.email_body="You are receiving this email because you have requested your #application.product_name# username.
    
Your username is #get_username.user_name#.
    
Please contact the Help Desk at 202-358-HELP(4357) if you did not request your username.";
		variables.created_by=0;
	</cfscript>
    <cfmail to="#get_username.email_address#" from="#application.application_specific_settings.system_email_sender#" subject="#attributes.subject#" server="#application.email_server_name#">
#attributes.email_body#
    </cfmail>
	<cfinclude template="../common_files/act_log_email.cfm">
	<cfset variables.username_found_ind=1>
<cfelse>
	<cfset variables.username_found_ind=0>
</cfif>