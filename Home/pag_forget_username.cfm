<!-- Home/pag_forget_username.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_forget_username.cfm">
	<responsibilities>
		I get passwords for users who have forgotten their passwords.
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
<cfoutput>
<cfparam name="attributes.email_address" default="">
<cfparam name="attributes.method" default="">
<cfif NOT comparenocase(attributes.method, "submit")>
	<cfinclude template="act_forget_username.cfm">
	<cfinclude template="dsp_forget_username.cfm">
<cfelse>
	<cfinclude template="dsp_forget_username_form.cfm">
</cfif>
</cfoutput>