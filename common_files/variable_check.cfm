
<!--common_files/variable_check.cfm
	Author: Jeromy F-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="variable_check.cfm">
	<responsibilities>
		I evaluate to see if necessary variables exist. If it doesn't, tag displays a message that says "You have entered [the app] via an invalid url. This problem may be caused by using a history/favorite/bookmark link. Please update your bookmarks to point to "index.cfm?fuseaction=#relocate#". Tag then relocates the user to the page specified after an irritating delay.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfscript>
if (NOT isdefined("attributes.check_variable")) {
	request.no_check_variables=1;
}
if (NOT isdefined("attributes.relocate")) {
	request.no_relocate=1;
}
if (cgi.server_port_secure) {
	variables.url_starter="https://";
}
else {
	variables.url_starter="http://";
}
</cfscript>

<cfif isdefined("request.no_check_variables") OR isdefined("request.no_relocate")>
<html>
<head>
	<link href="//s3.amazonaws.com/Workstream/Workstream.css" rel="stylesheet">
</head>
<body>
<cfif isdefined("request.no_check_variables")>
	<div class="alert alert-error">
		<p>Required attribute 'check_variable' not set. You must set check_variable to be the first variable that is evaluated on the template calling this page.</p>
		<p>Examples:
			<ul>
				<li>&lt;cf_variable_check <strong>check_variable="attributes.open_month"</strong> relocate="trending_input"&gt;</li>
				<li>&lt;cf_variable_check <strong>check_variable="attributes.Metrics"</strong> relocate="std_diagnostics_input"&gt;</li>
			</ul>
		</p>
	</div>
</cfif>
<cfif isdefined("request.no_relocate")>
	<div class="alert alert-error">
		<p>Required attribute 'relocate' not set. You must set relocate to the URL (after the server name) of the page that the user is redirected to after they get a chance to read the nice message imploring them to reset their bookmarks or not use their history.</p>
		<p>Examples:
			<ul>
				<li>&lt;cf_variable_check check_variable="attributes.open_month" <strong>relocate="trending_input"</strong>&gt;</li>
				<li>&lt;cf_variable_check check_variable="attributes.Metrics" <strong>relocate="std_diagnostics_input"</strong>&gt;</li>
			</ul>
		</p>
	</div>
</cfif>
</body>
</html>
<cfabort>
</cfif>

<cfif NOT isdefined("caller.#attributes.check_variable#")>
	<cfscript>
		variables.url_starter="#variables.url_starter##cgi.server_name#";
		if (cgi.server_port EQ 8500) {
			variables.url_starter="#variables.url_starter#:8500";
		}
		request.content="#variables.url_starter##cgi.script_name#?fuseaction=#attributes.relocate#";
	</cfscript>
<cfoutput>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>#application.product_name#</title>
	<link href="//s3.amazonaws.com/Workstream/images/workstream_icon.ico" rel="SHORTCUT ICON" />
	<link rel="stylesheet" href="//s3.amazonaws.com/Application_Manager/error_style.css">
	<script language="JavaScript" type="text/javascript">
		//send the user to the appropriate page after an annoying wait
		setTimeout(function() {
			window.location.replace('#request.content#');
		}, 8000);
	</script>
</head>

<body class="warning">
<section class="center">
	<div class="error_header" aria-hidden="true">
		<img src="//s3.amazonaws.com/Application_Manager/images/gears1.png" alt="" width="64" height="64" />
	</div>
	<div class="content">
		<p class="header">You have entered #application.product_name# through an illegal URL.</p>
		<p>
			This problem may be caused by using a poorly formed history or favorite/bookmark link.
			<ul>
				<li>Momentarily you will be re-directed to suitable page within #application.product_name#.</li>
				<li>Please update any favorites/bookmarks to point to <a href="#request.content#">#request.content#</a></li>
			</ul>
		</p>
	</div>
</section>
</body>
</html>
</cfoutput>
<cfabort>
</cfif>