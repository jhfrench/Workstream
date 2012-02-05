<!-- Home/pag_login.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_login.cfm">
	<responsibilities>
		I act as the page that contains the login form and the login action template.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Omoniyi Fajemidupe" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.user_name" default="">
<cfparam name="attributes.method" default="">
<cfparam name="attributes.requested_page" default="#application.fusebox.defaultfuseaction#">
<cfparam name="variables.display_message" default="">

<!--- if the form is submitted --->
<cfif NOT comparenocase(attributes.method,"Login")>
	<cfinclude template="act_login.cfm">
</cfif>

<cfinclude template="dsp_login.cfm">