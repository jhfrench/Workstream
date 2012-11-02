<!-- Home/act_forget_password.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_forget_password.cfm">
	<responsibilities>
		I provide the form where a user enters username to get password reset.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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
<cfif get_username.account_status_id EQ 1>
	<cfset attributes.user_account_id=get_username.user_account_id>
	<cfinclude template="../Administration/pag_reset_password.cfm">
<cfelse>
	<div class="alert alert-error" style="position:relative;top:10px;">
		<cfoutput>#application.product_name#</cfoutput> cannot authorize your access because your username is invalid. You may <a href="index.cfm?fuseaction=Home.login" title="go back">try to log in again</a>.
	</div>
</cfif>
