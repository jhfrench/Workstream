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
	<!--- $issue$: need to give recipient of this message an "out" so they can stop receiving these notifications --->
	<cfmail to="#get_username.email_address#" from="#application.system_email_sender#" subject="#application.product_name# Username" type="HTML"
		server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
		port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
You are receiving this email because you have requested your #application.product_name# username. 

Your username is #get_username.user_name#. 

Please contact your #application.product_name# administrator if you did not request your username.
	</cfmail>
	<cfset variables.username_found_ind=1>
<cfelse>
	<cfset variables.username_found_ind=0>
</cfif>