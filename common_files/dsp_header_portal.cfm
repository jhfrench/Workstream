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
<html>
<head>
	<title>#application.html_title#</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta http-equiv="expires" content="#gethttptimestring(application.last_updated)#" />
	<!--Meta Data starts-->
	<!--SYSTEM DEFINED METADATA-->
	<meta name="dc.title" content="#application.html_title#" />
	<meta name="dc.format" content="text/html" />
	<meta name="dc.date.modified" content="#application.last_updated#" />
	<meta name="dc.language" content="en" />
	<meta name="dc.publisher" content="Applied Internet Technologies: #application.application_specific_settings.nasa_official#" />
	<!--Meta Data ends-->
	<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />
	<link href="common_files/Workstream_#session.workstream_text_size#.css?cache_escape=#variables.cache_escape#" rel="stylesheet" />
	<script src="common_files/prototype.js?cache_escape=#variables.cache_escape#"></script>
	<script src="common_files/scriptaculous.js?cache_escape=#variables.cache_escape#"></script>
	<script src="common_files/slider.js?cache_escape=#variables.cache_escape#"></script>
	<script src="common_files/block.js?cache_escape=#variables.cache_escape#"></script>
	<script src="common_files/Workstream.js?cache_escape=#variables.cache_escape#"></script>
	<script src="common_files/SpryMenuBar.js?cache_escape=#variables.cache_escape#"></script>
	<script type="text/javascript">
		(function () {
			if (/Microsoft/.test(navigator.appName)) { return }

			window.onload = function () {
				<cfif application.help.active_ind>Element.hide('help_area');</cfif>
				#get_screen_details.body_onload#
				var menu = document.getElementById('menu');
				var init = menu.offsetTop;
				var docked;

				window.onscroll = function () {
					if (!docked && (menu.offsetTop - scrollTop() < 0)) {
						menu.style.top = 0;
						menu.style.position = 'fixed';
						menu.className = 'docked';
						docked = true;
					} else if (docked && scrollTop() <= init) {
						menu.style.position = 'absolute';
						menu.style.top = init + 'px';
						menu.className = menu.className.replace('docked', '');
						docked = false;
					}
				};
			};
		})();
	</script>
</head>
<body bgcolor="##000000">
<table align="center" bgcolor="##ffffff" width="1180" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="##000000" colspan="5" height="10" width="1180"><img src="images/spacer.gif" alt="" height="10" width="1" border="0" /></td>
	</tr>
	<tr> 
		<td bgcolor="##000000" rowspan="4" width="10"><img src="images/spacer.gif" alt="" height="1" width="10" border="0" /></td>
		<td colspan="3" width="1160">
<header>
			<div style="position:absolute;top:-100em;left:-100em;">
				<!-- Skip navigation link -->
				<a href="##begin_page_content" title="hidden browser link to skip repetitive navigation" class="footerLnk">- Skip Nav</a>
			</div>
		<!-- Top Nav Bar starts -->
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
			<div id="nav_placeholder" style="height:15px;">
				<nav id="menu">
					<cfinclude template="qry_get_module_sub_navigation.cfm" /><!--- 
					<cfmodule template="qry_get_program_year.cfm" program_year_id="#session.program_year_id#"> --->
					<cfinclude template="dsp_navigation_module.cfm" />
				</nav>
			</div>
</header>
		<!-- Top Nav Bar ends -->
		</td>
		<td bgcolor="##000000" rowspan="4" width="10"><img src="images/spacer.gif" alt="" height="1" width="10" border="0" /></td>
	</tr>
	<tr>
		<td valign="top" width="1076">
		<!-- START MAIN BODY -->
		<a name="begin_page_content"></a>
			<table bgcolor="##ffffff" border="0" cellspacing="0" cellpadding="0" cols="3" width="1076">
				<tr>
					<td><img src="images/spacer.gif" alt="" height="400" width="2" border="0" /></td>
					<td valign="top" width="363"> 
						<img src="images/spacer.gif" alt="" height="1" width="880" border="0" />

<!--- if user does not have access to this fuseaction, tell them and abort processing --->
<cfif len(variables.access_message)>
	#variables.access_message#
	<cfinclude template="dsp_footer.cfm">
	<cfabort>
</cfif>
</cfoutput>