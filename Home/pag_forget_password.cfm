<!-- Home/pag_forget_password.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_forget_password.cfm">
	<responsibilities>
		I get passwords for users who have forgotten their passwords.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Omoniyi Fajemidupe" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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
<cfoutput>
<cfparam name="attributes.user_name" default="">
<cfparam name="attributes.method" default="">
<cfif NOT comparenocase(attributes.method, "submit")>
	<cfinclude template="act_forget_password.cfm">
<cfelse>
	<cfinclude template="dsp_forget_password_form.cfm">
</cfif>
</cfoutput>