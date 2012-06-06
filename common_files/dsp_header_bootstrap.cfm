<!-- common_files/dsp_header_portal.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_header_portal.cfm">
	<responsibilities>
		I display the main application header using the NASA portal format, including application-specific navigation options.
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
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js" lang="en"> <![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>#application.html_title# (Twitter Bootstrap demo)</title>
	<meta name="description" content="">
	<meta name="author" content="Applied Internet Technologies: #application.application_specific_settings.nasa_official#">
	<meta http-equiv="expires" content="#gethttptimestring(application.last_updated)#" />

	<meta name="viewport" content="width=device-width">

	<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />	
	
	<script src="//enhancejs.googlecode.com/files/enhance.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		//if enhance.js determines they can be supported, load the following CSS and JavaScript recourse
		enhance({
			loadScripts: [
				'//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js',
				'common_files/js/libs/modernizr-2.5.3-respond-1.1.0.min.js'
			],
			queueLoading: true
		});
	</script>
	
	<link rel="stylesheet/less" href="common_files/less/style.less">	
</head>
<body class="container-fluid">
	<header role="banner" class="row-fluid">
		<div style="position:absolute;top:-100em;left:-100em;">
			<!-- Skip navigation link -->
			<a href="##begin_page_content" title="hidden browser link to skip repetitive navigation" class="footerLnk">- Skip Nav</a>
		</div>
		<div class="span12">
			<div class="row-fluid">
				<div class="span1"></div>
				<div class="span10">
				<cfif application.application_specific_settings.banner_only_ind>
					<div style="height:120px; width:1160px; background:url(images/full_#variables.mast_image_name#) no-repeat center; display:table-cell; vertical-align:middle;">
						<a href="#application.application_specific_settings.nasa_organization_url#" style="padding:20px; color:##FFFFFF;font-size:24px;font-weight:bold; text-shadow:##333333 2px 2px 0px;">#application.application_specific_settings.nasa_organization#</a>
					</div>
				<cfelse>
					<div style="height:150px; width:1160px; background-color:##006699; display:table-cell; vertical-align:middle;">
						<img src="images/#variables.mast_image_name#" alt="#application.application_specific_settings.nasa_organization#" align="left" width="548" height="150" border="0" />
						<a href="#application.application_specific_settings.nasa_organization_url#" style="padding:20px; color:##FFFFFF; font-size:24px; font-weight:bold; text-shadow:##333333 2px 2px 0px; vertical-align:middle;">#application.application_specific_settings.nasa_organization#</a>
					</div>
				</cfif>
				</div>
				<div class="span1"></div>
			</div>
			<nav role="navigation" class="navbar">
				<div class="navbar-inner">
					<div class="container">
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
						<div class="nav-collapse" id="menu">
							<ul class="nav">
								<cfinclude template="qry_get_module_sub_navigation.cfm" /><!--- 
								<cfmodule template="qry_get_program_year.cfm" program_year_id="#session.program_year_id#"> --->
								<cfinclude template="dsp_navigation_module.cfm" />
							</ul>
						</div><!--/.nav-collapse -->
					</div>
		 		</div>
			</nav>
		</div>
	</header>

	<div class="row-fluid">
		<section id="begin_page_content" role="main" class="span10">
	
	
	
	

<!--- if user does not have access to this fuseaction, tell them and abort processing --->
<cfif len(variables.access_message)>
	#variables.access_message#
	<cfinclude template="dsp_footer.cfm">
	<cfabort>
</cfif>
</cfoutput>