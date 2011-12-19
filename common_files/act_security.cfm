<!-- common_files/act_security.cfm
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
	<cfparam name="url.fuseaction" default="#application.fusebox.defaultfuseaction#">
	<cfset variables.error_message="">
	<cfset variables.new_location="">
	<cfset variables.current_location="#cgi.http_host##cgi.script_name#">
</cfsilent>

<cfif NOT len(cgi.query_string)>
	<!--- if the user requests the root directory, redirect to the default fuseaction --->
	<cflocation url="index.cfm?fuseaction=#url.fuseaction#" addtoken="no">
<cfelseif listfindnocase(application.private_fuseactions, url.fuseaction)>
	<!--- if the fuseaction is for one of the protected pages --->
	<cfset variables.page_is_secure_ind=1>
	<cfif NOT isdefined("session.user_account_id") AND comparenocase(url.fuseaction,"Home.login")>
		<!--- if the user's user_account_id is not defined in the session scope and the fuseaction is not for the login page --->
		<cfif len(url.fuseaction)>
			<!--- if we have a fuseaction in the URL --->
			<!--- 3. Prevent from navigating the application after timed out or logged out --->
			<cfif find(variables.current_location, listfirst(cgi.http_referer,"?"))>
				<!---if the refer is the same application, then the session has timed out--->
				<cfset variables.error_message="It looks like your session timed out (they only last #variables.sessiontimeout*24*60# minutes). Please login again.">
			<cfelse>
				<cfset variables.error_message="Please login.">
			</cfif>
			<cfset variables.new_location="index.cfm?fuseaction=Home.logout&requested_page=#url.fuseaction#">
		<cfelse>
			<!--- if we don't have a fuseaction in the URL --->
			<cfset variables.new_location="index.cfm?fuseaction=Home.main">
			<cflocation url="index.cfm?fuseaction=Home.login&requested_page=#application.fusebox.defaultfuseaction#" addtoken="no">
		</cfif>
	<cfelseif NOT (isdefined("cgi.http_referer") AND len(cgi.http_referer))>
		<!--- if we don't know the http_referer --->
		<!--- 1. Prevent from directly typing in url --->
		<cfset variables.error_message="You are being logged out due to a badly formed access attempt.">
		<cfset variables.new_location="index.cfm?fuseaction=Home.logout">
	<cfelseif comparenocase(right(listfirst(cgi.http_referer,"?"),len(variables.current_location)), variables.current_location)>
		<!--- if the page request is not originating from the application's host server --->
		<!--- 2. Prevent unauthorized interface attempts from other applications --->
		<cfset variables.error_message="This is a United States of America government site. Any unauthenticated access is prohibited.1">
		<cfset variables.new_location="index.cfm?fuseaction=Home.logout&requested_page=#url.fuseaction#">
	</cfif>
<cfelse>
	<!--- if we have a fuseaction in the URL and the fuseaction is not for one of the protected pages --->
	<cfset variables.page_is_secure_ind=0>
	<cfif len(cgi.http_referer) AND NOT (findnocase("127.0.0.1", cgi.http_referer) OR findnocase("localhost", cgi.http_referer) OR findnocase("boston", cgi.http_referer) OR findnocase("192.168.1.6", cgi.http_referer))>
		<!--- if we do know the refering page, and the refering page doesn't originate from nasa.gov or hitsshq.com --->
		<!--- 2. Prevent unauthorized interface attempts from other applications --->
		<cfset variables.error_message="This is a United States of America Government site. Any unauthenticated access is prohibited.2">
		<cfset variables.new_location="index.cfm?fuseaction=#application.fusebox.defaultfuseaction#">
	</cfif>
</cfif>

<cfif len(variables.error_message)>
	<cfoutput>
	<html>
		<head>
			<title>#application.html_title#</title>
			<script language="JavaScript" type="text/javascript">
				alert("#variables.error_message#");
				window.location.href="#variables.new_location#";
			</script>
			<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />
		</head>
		<body>
			<a href="#variables.new_location#">#variables.error_message#</a>
		</body>
	</html>
	</cfoutput>
	<cfabort>
</cfif>