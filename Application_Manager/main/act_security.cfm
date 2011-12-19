<!-- main/act_security.cfm
	Author: Jeromy French -->
<cfsilent>
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_security.cfm">
	<responsibilities>
		I secure the application against some of the more common "hacking" techniques.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/21/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="application.fusebox.defaultfuseaction" default="main.welcome">
<cfset variables.public_fuseactions="main.login">
<cfparam name="url.fuseaction" default="">
<cfset variables.error_message="">
<cfset variables.new_location="">
<cfset variables.current_location="#cgi.http_host##cgi.script_name#">
</cfsilent>

<cfif NOT listfindnocase(variables.public_fuseactions, url.fuseaction)>
	<cfif NOT isdefined("session.user_account_id") AND comparenocase(url.fuseaction,"main.login")>
		<cfif len(url.fuseaction) AND listfindnocase(cgi.http_referer, "Application_Manager", "/") EQ 0>
			<cflocation url="index.cfm?fuseaction=main.login&requested_page=#url.fuseaction#" addtoken="no">
		<cfelseif len(url.fuseaction)>
			<!--- 3. Prevent from navigating Application_Manager after timed out or logged out --->
			<cfset variables.error_message="Your session has expired, please login again.">
			<cfset variables.new_location="index.cfm?fuseaction=main.logout&requested_page=#url.fuseaction#">
		<cfelse>
			<cflocation url="index.cfm?fuseaction=main.login&requested_page=#application.fusebox.defaultfuseaction#" addtoken="no">
		</cfif><!---
	<cfelseif NOT (isdefined("cgi.http_referer") AND len(cgi.http_referer))>
		<!--- 1. Prevent from directly typing in url --->
		<cfset variables.error_message="You are being logged out due to a badly formed access attempt.">
		<cfset variables.new_location="index.cfm?fuseaction=Application_Manager.logout">
	<cfelseif comparenocase(right(listfirst(cgi.http_referer,"?"),len(variables.current_location)), variables.current_location)>
		<!--- 2. Prevent unauthorized interface attempts from other applications --->
		<cfset variables.error_message="This is a US government site. Any unauthenticated access is prohibited.">
		<cfset variables.new_location="index.cfm?fuseaction=Application_Manager.logout"> --->
	</cfif>
</cfif>

<cfif len(variables.error_message)>
	<cfif NOT isdefined("session.redirected_ind")>
		<cfoutput>
		<html>
			<head>
			<script language="javascript" type="text/javascript">
				alert("#variables.error_message#");
				window.location.href="#variables.new_location#";
			</script>
			</head>
			<body>
				<a href="#variables.new_location#">#variables.error_message#</a>
			</body>
		</html>
		</cfoutput>
		<cfset session.redirected_ind=0>
	</cfif>
	<cfabort>
</cfif>