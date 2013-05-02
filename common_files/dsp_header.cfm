<!-- common_files/dsp_header.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_header.cfm">
	<responsibilities>
		I display the main application header, including application-specific navigation options.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
variables.access_message="";
variables.allowed_modules=valuelist(get_module_navigation.module_id);
if (variables.page_is_secure_ind AND listfind(get_screen_details.screen_access_ind,1) EQ 0)
	variables.access_message="<strong>Busted!</strong><br />Your access is not authorized for this screen.";
else
	if (listfind(get_screen_details.locked_ind,1)) {
		variables.access_message="This module has been locked.";
		if (len(get_screen_details.lock_module_comment))
			variables.access_message="#variables.access_message#<br />#get_screen_details.lock_module_comment#";
	}
</cfscript><!---
<cfmodule template="qry_get_system_note.cfm"> --->

<cfoutput>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>#application.product_name#</title>
	<meta name="description" content="Applied Internet Technologies timekeeping software">
	<meta name="author" content="Applied Internet Technologies: #application.application_specific_settings.official#">
	<meta http-equiv="expires" content="#gethttptimestring(now())#" />

	<meta name="viewport" content="width=device-width">

	<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />
	<link rel="stylesheet" href="common_files/Workstream.css">

	<script src="common_files/js/modernizr.custom.40623.js"></script>
	<script type="text/javascript">
	//if Modernizr determines they can be supported, load the following CSS and JavaScript resources
	Modernizr.load([
		{
			both: [
				'//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'
			],
			complete: function(){
				if ( !window.jQuery ) {
					Modernizr.load([
						{
							both: [
								'common_files/js/jquery.min.js'
							]
						}
					]);
				};
			}
		},
		{
			load: [
				'//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js'
			],
			complete: function(){
				if ( !window.jQuery.support ) {
					Modernizr.load([
						{
							load: [
								'common_files/js/bootstrap.min.js'
							]
						}
					]);
				}
			}
		},
		{
			// This will wait for the fallback to load and execute if it needs to.
			both: [
				'common_files/js/plugins.js',
				'common_files/js/script.js'
			],
			complete: function () {
				$(document).ready(function() {
					<cfoutput>#get_screen_details.body_onload#</cfoutput>
				});
			}
		}
	]);
	</script>
</head>
<body class="container-fluid">
	<header role="banner" class="row-fluid">
		<!-- Skip navigation link -->
		<a href="##content_container" class="hide-text" aria-hidden="false">Skip navigation</a>
		<div class="span12">
			<nav role="navigation" class="navbar navbar-inverse navbar-fixed-top">
				<div class="navbar-inner">
					<div class="container">
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
						<a href="index.cfm?fuseaction=Timekeeping.home" class="brand"><i class="icon_workstream img-circle" title="#application.application_specific_settings.organization# Workstream"></i> Workstream</a>
						<div class="nav-collapse" id="menu">
							<ul class="nav">
								<cfinclude template="qry_get_module_sub_navigation.cfm" /><!---
								<cfmodule template="qry_get_program_year.cfm" program_year_id="#session.program_year_id#"> --->
								<cfinclude template="dsp_navigation_module.cfm" />
							</ul>
							<form id="form-navbar-search" class="navbar-search pull-left" action="index.cfm?fuseaction=Tools.search_results" method="post">
								<div class="input-append">
									<input type="text" name="header_search_criteria" id="header_search_criteria" title="Criteria to search" placeholder="search" class="search-query span4" />
									<input type="submit" name="quick" value="Quick" title="Search on task ID or task name" class="btn btn-inverse" />
									<a href="index.cfm?fuseaction=Tools.search_criteria" id="navbar-search-full" title="Start a full search" rel="search" class="btn btn-inverse">Full</a>
								</div>
							</form><cfif application.help.active_ind>
							<form class="navbar-form pull-right">
								<a href="##help_area" id="nav_help_button" title="Access the help system" rel="help" class="btn btn-info cursor_help">Help</a>
							</form></cfif>
							<ul class="nav pull-right">
								<cfif NOT isdefined("variables.user_identification")>
									<li><a href="index.cfm?fuseaction=Home.login" class="login_link"><strong>Sign in for More Access</strong></a></li>
								<cfelseif session.password_created_by EQ variables.user_identification>
									<li><a href="index.cfm?fuseaction=Home.logout" class="login_link"><strong>Sign out <cfoutput>#session.first_name# #session.last_name#</cfoutput></strong></a></li>
								</cfif>
							</ul>
						</div><!--/.nav-collapse -->
					</div>
		 		</div>
			</nav>
		</div>
	</header>

	<div class="row-fluid">
		<section id="content_container" role="main" class="span12">





<!--- if user does not have access to this fuseaction, tell them and abort processing --->
<cfif len(variables.access_message)>
	<div class="alert alert-error" style="margin-top:200px;">
		#variables.access_message#
	</div>
	<cfinclude template="dsp_footer.cfm">
	<cfabort>
</cfif>
</cfoutput>
