<!-- common_files/dsp_header_portal.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_header_portal.cfm">
	<responsibilities>
		I display the main application header using the NASA portal format, including application-specific navigation options.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
<html xmlns='http://www.w3.org/1999/xhtml'>
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
		<link href="common_files/ngauge.css?cache_escape=#variables.cache_escape#" type="text/css" rel="stylesheet" />
		<link href="common_files/application.css?cache_escape=#variables.cache_escape#" type="text/css" rel="stylesheet" />
		<link href="common_files/common.css?cache_escape=#variables.cache_escape#" type="text/css" rel="stylesheet" />
		<link href="common_files/print.css?cache_escape=#variables.cache_escape#" rel="stylesheet" type="text/css" media="print" />
		<link href="common_files/handheld.css?cache_escape=#variables.cache_escape#" type="text/css" rel="stylesheet" media="handheld" />
		<link href="common_files/screen.css?cache_escape=#variables.cache_escape#" type="text/css" rel="stylesheet" media="screen" />
		<script src="common_files/common.js?cache_escape=#variables.cache_escape#" type="text/javascript" language="javascript"></script>
		<script src="common_files/prototype.js?cache_escape=#variables.cache_escape#" type="text/javascript"></script>
		<script src="common_files/scriptaculous.js?cache_escape=#variables.cache_escape#" type="text/javascript"></script>
		<script src="common_files/slider.js?cache_escape=#variables.cache_escape#" type="text/javascript"></script>
		<script src="common_files/block.js?cache_escape=#variables.cache_escape#" type="text/javascript"></script>
		<script src="common_files/SpryMenuBar.js?cache_escape=#variables.cache_escape#" type="text/javascript"></script>
	</head>
<body bgcolor="##000000" onLoad="<cfif application.use_help_module_ind>Element.hide('help_area');</cfif>#get_screen_details.body_onload#">
<table align="center" bgcolor="##ffffff" width="1180" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="##000000" colspan="5" height="10" width="1180"><img src="images/spacer.gif" alt="" height="10" width="1" border="0" /></td>
	</tr>
	<tr> 
		<td bgcolor="##000000" rowspan="4" width="10"><img src="images/spacer.gif" alt="" height="1" width="10" border="0" /></td>
		<td colspan="3" width="1160">
			<div style="position:absolute;top:-100em;left:-100em;">
				<!-- Skip navigation link -->
				<a href="##begin_page_content" title="hidden browser link to skip repetitive navigation" class="footerLnk">- Skip Nav</a>
				<cfloop query="get_hidden_navigation_links">
				<a href="index.cfm?fuseaction=#fuseaction###begin_page_content" title="hidden browser link to view #business_function_description#"></a></cfloop>
			</div>
		<!-- Top Nav Bar starts -->
			<table width="1160" border="0" cellspacing="0" cellpadding="0" class="screen_only">
				<tbody>
				<tr>
					<td height="1" colspan="6"><img src="images/spacer.gif" alt="" height="1" width="1" border="0" /></td>
				</tr>
				<tr>
					<td colspan="6">
					<cfif application.application_specific_settings.banner_only_ind>
						<a href="#application.application_specific_settings.nasa_organization_url#"><img src="images/mast.jpg" alt="				#application.application_specific_settings.nasa_organization#" width="1160" height="120" border="0" /></a>
					<cfelse>
						<table height="150" width="1160" border="0" cellspacing="0" cellpadding="0" cols="2">
							<tr>
								<td bgcolor="##006699" height="148" style="color:##FFFFFF;font-size:24px;font-weight:bold;text-align:center;" class="forum">
									#application.application_specific_settings.nasa_organization#
								</td>
								<td height="150"><a href="#application.application_specific_settings.nasa_organization_url#"><img src="images/#variables.mast_image_name#" alt="#application.application_specific_settings.nasa_organization#" align="right" width="548" height="150" border="0" /></a></td>
							</tr>
						</table>
					</cfif>
					</td>
				</tr>
				<tr> 
					<td valign="top" colspan="6">
					<cfinclude template="qry_get_module_sub_navigation.cfm" /><!--- 
					<cfmodule template="qry_get_program_year.cfm" program_year_id="#session.program_year_id#"> --->
					<cfinclude template="dsp_navigation_module.cfm" />
					</td>
				</tr>
				</tbody>
			</table>
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