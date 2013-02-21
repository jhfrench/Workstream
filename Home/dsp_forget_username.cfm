<!-- Home/dsp_forget_username.cfm
	Author: Jeromy French -->

<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_forget_username.cfm">
	<responsibilities>
		I let the user know that we sent them their username in an email.
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

<cfif variables.username_found_ind>
	<div class="alert alert-success"><cfif NOT comparenocase(attributes.fuseaction, "Home.forget_username")>Your username was sent to your email at <cfoutput>'#trim(xmlformat(attributes.email_address))#'</cfoutput>.<br /> Please go to the <a href="index.cfm?fuseaction=Home.login" style="color:yellow;"><cfoutput>#application.product_name#</cfoutput> home page</a> and sign in with your username</cfif>.
<cfelse>
	<div class="alert alert-error"><cfoutput>#application.product_name# cannot find a username based on the email address '#trim(xmlformat(attributes.email_address))#'. You may <a href="index.cfm?fuseaction=Home.forget_username" title="try again with a different email address" style="color:yellow;">try again with a different email address</a>.</cfoutput>
</cfif>
</div>
