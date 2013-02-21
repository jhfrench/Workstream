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
	<cfset variables.current_location="#cgi.http_host##cgi.script_name#">
	<cfset variables.error_message="">
	<cfset variables.ignore_these="FIELDNAMES,FUSEACTION">
	<cfset variables.new_location="">
	<cfset variables.process_form_ind=0>
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
				<!---if the refer is the same application, then the session has either been dropped by an app upgrade, or timed out--->
				<cfif datediff("s", now(), application.last_updated) GT (qry_get_application_basic_details.sessiontimeout*24*60*60)>
					<cfset variables.error_message="#application.product_name# has been recently upgraded. We regret that it is necessary for you to login again.">
				<cfelse>
					<cfset variables.error_message="It looks like your session timed out (they only last #numberformat(qry_get_application_basic_details.sessiontimeout*24*60)# minutes). Please login again.">
				</cfif>
				<cfset variables.process_form_ind=1>
			<cfelse>
				<cfset variables.error_message="Please login.">
			</cfif>
			<cfset variables.new_location="index.cfm?fuseaction=Home.logout">
			<cfset variables.requested_page=url.fuseaction>
		<cfelse>
			<!--- if we don't have a fuseaction in the URL --->
			<cfset variables.new_location="index.cfm?fuseaction=Home.main">
			<cfset variables.requested_page=application.fusebox.defaultfuseaction>
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
		<cfset variables.new_location="index.cfm?fuseaction=Home.logout">
		<cfset variables.requested_page=url.fuseaction>
	</cfif>
<cfelse>
	<!--- if we have a fuseaction in the URL and the fuseaction is not for one of the protected pages --->
	<cfset variables.page_is_secure_ind=0>
	<cfif len(cgi.http_referer) AND NOT listcontainsnocase(application.valid_referer, listgetat(cgi.http_referer,2,"/"))>
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
		var submit_security_redirect=function() {
			document.getElementById('security_redirect').submit();	
		};
		
		var onload_ready=function(remaining_time) {
			if (arguments.callee.done) return; //don't execute more than once
			arguments.callee.done = true;
			document.getElementById('manual_link').href="##";
			document.getElementById('manual_link').onclick="javascript:submit_security_redirect(); return false;";
			setTimeout(function() {
				submit_security_redirect();
			}, remaining_time);
		};
		
		//once we're loaded, let's go!
		window.onload=function() {
			onload_ready(4000);
		};
		
		//this is a fallback for if something (CSS or an imag) doesn't load; don't wait longer than 3 seconds
		setTimeout(function() {
			onload_ready(1000);
		}, 3000);
	</script>
</head>

<body class="warning">
<section class="center">
	<div class="error_header" aria-hidden="true">
		<img src="Application_Manager/images/gears1.png" alt="" width="64" height="64" />
	</div>
	<div class="content">
		<p>#variables.error_message#</p>
		<p>If you aren't redirected shortly, please <a href="#variables.new_location#" id="manual_link">log in</a>.</p>
	</div>
</section>
<form id="security_redirect" action="#variables.new_location#" method="post">
	<cfif isdefined("variables.requested_page")><input type="hidden" name="requested_page" value="#variables.requested_page#"></cfif>
	<cfif variables.process_form_ind>
		<input type="hidden" name="process_form_ind" value="1" />
		<cfloop collection="#attributes#" item="variables.field">
			<cfif NOT listcontainsnocase(variables.ignore_these,variables.field)>
				<input type="hidden" name="#variables.field#" id="#variables.field#" value="#evaluate("attributes.#variables.field#")#" />
			</cfif>
		</cfloop>
	</cfif>
</form>
</body>
</html>
	</cfoutput>
	<cfabort>
</cfif>
