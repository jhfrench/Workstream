<!-- Home/act_forget_username.cfm
	Author: Jeromy French-->

<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_forget_username.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2010" role="FuseCoder" comments="Created File">
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
	<cfset attributes.user_account_id=get_username.user_account_id>
	<cfset ses_smtp = {} />
	<cfset ses_smtp.port = "465" />
	<cfset ses_smtp.server = "email-smtp.us-east-1.amazonaws.com" />
	<cfset application.email_server_name = "email-smtp.us-east-1.amazonaws.com" />
	<cfset ses_smtp.username = "AKIAITMQ2XQFMYSETTAQ " />
	<cfset ses_smtp.password = "AmDB4t9z4ITwKplJbrTf/09YtAo8COFW5aAYQ0fobl4F" />
 
	<cfmail to="#get_username.email_address#" from="#application.application_specific_settings.system_email_sender#" subject="#application.product_name# Username" server="#application.email_server_name#"
      type="HTML"
      username="#ses_smtp.username#"
      password="#ses_smtp.password#"
      usetls="true"
      usessl="true"
      port="#ses_smtp.port#">
You are receiving this email because you have requested your #application.product_name# username. 

Your username is #get_username.user_name#. 

Please contact the Help Desk <!--- $issue$: contact info at 202-358-HELP(4357)  ---> if you did not request your username.
	</cfmail>
	<cfset variables.username_found_ind=1>
<cfelse>
	<cfset variables.username_found_ind=0>
</cfif>