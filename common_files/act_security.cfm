<!-- common_files/act_security.cfm
	Author: Jeromy French -->
<cfsilent>
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_security.cfm">
	<responsibilities>
		I secure the application against some of the more common "hacking" techniques.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/21/2007" role="FuseCoder" comments="Created File">
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
	<cfif variables.user_identification EQ 0 AND comparenocase(url.fuseaction,"Home.login")>
		<!--- if the user's user_account_id is not defined in the session scope and the fuseaction is not for the login page --->
		<cfif len(url.fuseaction)>
			<!--- if we have a fuseaction in the URL --->
			<!--- 3. Prevent from navigating the application after timed out or logged out --->
			<cfif find(variables.current_location, listfirst(cgi.http_referer,"?"))>
				<!---if the refer is the same application, then the session has timed out--->
				<cfset variables.error_message="It looks like your session timed out (they only last #qry_get_application_basic_details.sessiontimeout*24*60# minutes). Please login again.">
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
		<cfset variables.error_message="Unauthenticated access is prohibited.1">
		<cfset variables.new_location="index.cfm?fuseaction=Home.logout&requested_page=#url.fuseaction#">
	</cfif>
<cfelse>
	<!--- if we have a fuseaction in the URL and the fuseaction is not for one of the protected pages --->
	<cfset variables.page_is_secure_ind=0>
	<cfif len(cgi.http_referer) AND NOT (findnocase("127.0.0.1", cgi.http_referer) OR findnocase("localhost", cgi.http_referer) OR findnocase("florence", cgi.http_referer) OR findnocase("192.168.1.3", cgi.http_referer))>
		<!--- if we do know the refering page, and the refering page doesn't originate from ait.com --->
		<!--- 2. Prevent unauthorized interface attempts from other applications --->
		<cfset variables.error_message="Unauthenticated access is prohibited.2">
		<cfset variables.new_location="index.cfm?fuseaction=#application.fusebox.defaultfuseaction#">
	</cfif>
</cfif>

<cfif len(variables.error_message)>
	<cfoutput>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>#application.product_name#</title>
	<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />
	<link rel="stylesheet" href="Application_Manager/errortemplates/error_style.css">
	<script language="JavaScript" type="text/javascript">
	setTimeout(function() {
		window.location.href="#variables.new_location#";
	}, 5000);
	</script>
</head>

<body class="warning">
<section class="center">
	<div class="error_header" aria-hidden="true">
		<img src="Application_Manager/images/gears1.png" alt="" width="64" height="64" />
	</div>
	<div class="content">
		<p>#variables.error_message#</p>
		<p>If you aren't redirected shortly, please <a href="#variables.new_location#">log in</a>.</p>
	</div>
</section>
</body>
</html>
	</cfoutput>
	<cfabort>
</cfif>