
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

<cfif isdefined("request.no_check_variables")>
<html>
<head>
	<link href="common_files/application.css" rel="stylesheet">
</head>
<body>
	<table align="center" width="80%" summary="Table displays required attributes">
		<tr>
			<td class="">
				Required attribute 'check_variable' not set. You must set check_variable to be the first variable that is evaluated on the template calling this custom tag.
				<p>Examples:</p>
				<ul>
					<li>&lt;cf_variable_check <strong>check_variable="attributes.open_month"</strong> relocate="trending_input"&gt;</li>
					<li>&lt;cf_variable_check <strong>check_variable="attributes.Metrics"</strong> relocate="std_diagnostics_input"&gt;</li>
				</ul>
			</td>
		</tr>
	</table>
</body>
</html>
	<cfabort>
</cfif>
<cfif isdefined("request.no_relocate")>
<html>
<head>
	<link href="common_files/application.css" rel="stylesheet">
</head>
<body>
	<table align="center" width="80%" summary="Table displays relocate not set">
		<tr>
			<td class="">
				Required attribute 'relocate' not set. You must set relocate to the URL (after the server name) of the page that the user is redirected to after they get a chance to read the nice message imploring them to reset their bookmarks or not use their history.
				<p>Examples:</p>
				<ul>
					<li>&lt;cf_variable_check check_variable="attributes.open_month" <strong>relocate="trending_input"</strong>&gt;</li>
					<li>&lt;cf_variable_check check_variable="attributes.Metrics" <strong>relocate="std_diagnostics_input"</strong>&gt;</li>
				</ul>
			</td>
		</tr>
	</table>
</body>
</html>
	<cfabort>
</cfif>

<cfif NOT isdefined("caller.#attributes.check_variable#")>
	<cfscript>
		variables.url_starter="#variables.url_starter##cgi.server_name#";
		if (cgi.server_port EQ 8500) {
			variables.url_starter="#variables.url_starter#:#cgi.server_port#";
		}
		request.content="#variables.url_starter##cgi.script_name#?fuseaction=#attributes.relocate#";
		session.application_page_redirect_ind=1;
	</cfscript>
<cfoutput>
<html xmlns='http://www.w3.org/1999/xhtml'>
	<head>
		<title>#application.html_title#</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta http-equiv="expires" content="#gethttptimestring(application.last_updated)#" />
		<meta http-equiv="refresh" content="5;url=<cfoutput>#request.content#</cfoutput>">
		<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />
		<link href="common_files/application.css" rel="stylesheet" />
	</head>
	<body>
		<table class="center" width="686" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><img src="Application_Manager/errortemplates/top.jpg" width="686" height="140" /></td>
			</tr>
			<tr>
				<td class="content">
					<h2 class="error_message">#application.html_title# alert!</h2>
					You have entered #application.html_title# through an illegal URL. This problem may be caused by using a poorly formed history or favorite/bookmark link.
					<ul>
						<li>Momentarily you will be re-directed to suitable page within #application.product_name#.</li>
						<li>Please update any favorites/bookmarks to point to <a href="#request.content#" class="">#request.content#</a></li>
					</ul>
					<p align="center" style="color:##808080"><abbr title="Applied Internet Technologies">AIT</abbr> Support Services</p>
				</td>
			</tr>
			<tr>
				<td><img src="Application_Manager/errortemplates/bottom.jpg" width="686" height="21" /></td>
			</tr>
		</table>
	</body>
</html>
</cfoutput>
<cfabort>
</cfif>

