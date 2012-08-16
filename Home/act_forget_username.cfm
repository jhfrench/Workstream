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
	<cfmail to="#get_username.email_address#" from="#application.application_specific_settings.system_email_sender#" server="#application.email_server_name#" subject="#application.product_name# Username">
You are receiving this email because you have requested your #application.product_name# username. 

Your username is #get_username.user_name#. 

Please contact the Help Desk at <!--- $issue$: contact info ---> 202-358-HELP(4357) if you did not request your username.
	</cfmail>
	<cfset variables.username_found_ind=1>
<cfelse>
	<cfset variables.username_found_ind=0>
</cfif>