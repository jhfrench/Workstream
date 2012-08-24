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
			(10/15/07 | JF) Brought right-hand help column more to the left.
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
if (NOT isdefined("variables.mast_image_name"))
	variables.mast_image_name="mast.jpg";
if (variables.page_is_secure_ind AND listfind(get_screen_details.screen_access_ind,1) EQ 0)
	variables.access_message="Your access is not authorized for this screen.";
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

	<title>#application.html_title#</title>
	<meta name="description" content="Applied Internet Technologies timekeeping software">
	<meta name="author" content="Applied Internet Technologies: #application.application_specific_settings.official#">
	<meta http-equiv="expires" content="#gethttptimestring(now())#" />

	<meta name="viewport" content="width=device-width">

	<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />
	<link rel="stylesheet" href="common_files/less/Workstream.css">

	<script src="common_files/js/libs/modernizr-2.5.3-respond-1.1.0.min.js"></script>
	<script type="text/javascript">
		//if Modernizr determines they can be supported, load the following CSS and JavaScript resources
		Modernizr.load([
			{
				load: [
					'//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'
				],
				complete: function () {
					if ( !window.jQuery ) {
						Modernizr.load('common_files/js/libs/jquery-1.7.2.min.js');
					}
				}
			},
			{
				// This will wait for the fallback to load and execute if it needs to.
				load: [
					'//ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js',
					'//current.bootstrapcdn.com/bootstrap-v204/js/bootstrap-transition.js',
					'//current.bootstrapcdn.com/bootstrap-v204/js/bootstrap-collapse.js',
					'//current.bootstrapcdn.com/bootstrap-v204/js/bootstrap-dropdown.js',
					'//current.bootstrapcdn.com/bootstrap-v204/js/bootstrap-tab.js',
					'common_files/js/plugins.js',
					'common_files/js/script.js'
				]
			},
			{
				complete: function () {
					<cfoutput>#get_screen_details.body_onload#</cfoutput>
				}
			}
		]);
	</script>
</head>
<body class="container-fluid">
	<header role="banner" class="row-fluid">
		<div style="position:absolute;top:-100em;left:-100em;">
			<!-- Skip navigation link -->
			<a href="##begin_page_content" title="hidden browser link to skip repetitive navigation" class="footerLnk">- Skip Nav</a>
		</div>
		<div class="span12">
			<nav role="navigation" class="navbar navbar-fixed-top">
				<div class="navbar-inner">
					<div class="container">
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
						<span class="brand "><a href="index.cfm?fuseaction=Timekeeping.home"><img src="images/workstream_icon.png" height="17" width="16" alt="#application.application_specific_settings.organization# Workstream" /></a>Workstream</span>
						<div class="nav-collapse" id="menu">
							<ul class="nav">
								<cfinclude template="qry_get_module_sub_navigation.cfm" /><!--- 
								<cfmodule template="qry_get_program_year.cfm" program_year_id="#session.program_year_id#"> --->
								<cfinclude template="dsp_navigation_module.cfm" />
							</ul>
							<form class="navbar-search pull-left" action="index.cfm?fuseaction=Search.output" method="post">
								<input type="text" name="header_search_criteria" title="Search on task ID or task name" placeholder="search" class="search-query span5">
							</form>
							<ul class="nav pull-right"><cfif application.help.active_ind>
								<li><a href="##help_area" id="nav_help_button" title="Access the #application.product_name# help system" class="btn btn-mini btn-info" style="color:##ffffff;">Help</a></li></cfif>
								<cfif isdefined("session.user_account_id")><cfif session.password_created_by EQ session.user_account_id><li><a href="index.cfm?fuseaction=Home.logout" class="login_link"">Logout <cfoutput>#session.first_name# #session.last_name#</cfoutput></a></li></cfif><cfelse><li><a href="index.cfm?fuseaction=Home.login" class="login_link">Login for More Access</a></li></cfif>
							</ul>
						</div><!--/.nav-collapse -->
					</div>
		 		</div>
			</nav>
		</div>
	</header>

	<div class="row-fluid">
		<section id="begin_page_content" role="main" class="span9">





<!--- if user does not have access to this fuseaction, tell them and abort processing --->
<cfif len(variables.access_message)>
	#variables.access_message#
	<cfinclude template="dsp_footer.cfm">
	<cfabort>
</cfif>
</cfoutput>