<!-- Home/dsp_forget_username.cfm
	Author: Alicia McPherson -->

<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_forget_username.cfm">
	<responsibilities>
		I let the user know that we sent them their username in an email.
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
<div style="position:relative;top:10px;">
<table cellspacing="1" cellpadding="4" border="0" width="250" summary="table displays password reset confirmation">
	<tr>
		<td style="color:white;">
		<cfif variables.username_found_ind>
			<cfif NOT comparenocase(attributes.fuseaction, "Home.forget_username")>Your username was sent to your email at <cfoutput>'#trim(xmlformat(attributes.email_address))#'</cfoutput>.<br /> Please go to the <a href="index.cfm?fuseaction=Home.login" style="color:yellow;"><cfoutput>#application.product_name#</cfoutput> home page</a> and log in with your username</cfif>.</td>
		<cfelse>
			<cfoutput>#application.product_name# cannot find a username based on the email address '#trim(xmlformat(attributes.email_address))#'. You may <a href="index.cfm?fuseaction=Home.forget_username" title="try again with a different email address" style="color:yellow;">try again with a different email address</a>.</cfoutput>
		</cfif>
	</tr>
</table>
</div>
