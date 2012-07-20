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
<cfset variables.forget_password_page_ind=1>
<cfinclude template="qry_get_username.cfm">
<cfif get_username.account_status_id EQ 1>
	<cfset attributes.user_account_id=get_username.user_account_id>
	<cfinclude template="../Administration/pag_reset_password.cfm">
<cfelse>
	<div style="position:relative;top:10px;">
		<table cellspacing="1" cellpadding="4" width="100%" border="0" width="250" summary="Table displays invalid username">
		<tr>
			<td style="color:white;">
			<cfoutput><abbr title="#application.html_title#">#application.product_name#</abbr></cfoutput> cannot authorize your access because your username is invalid. You may <a href="index.cfm?fuseaction=Home.login" title="go back" style="color:yellow;">try to log in again</a>.
			</td>
		</tr>
		</table>
	</div>
</cfif>