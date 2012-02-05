<!-- common_files/dsp_header_login.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_header_login.cfm">
	<responsibilities>
		I display a header for the login page.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
<html>
	<head>
		<cfoutput><title>#application.html_title#</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta http-equiv="expires" content="#now()#">
		<link href="common_files/application.css?cache_escape=#variables.cache_escape#" type="text/css" rel="stylesheet" />
		<link href="common_files/print.css?cache_escape=#variables.cache_escape#" rel="stylesheet" type="text/css" media="print" />
		<link href="common_files/handheld.css?cache_escape=#variables.cache_escape#" type="text/css" rel="stylesheet" media="handheld" />
		<link href="common_files/screen.css?cache_escape=#variables.cache_escape#" type="text/css" rel="stylesheet" media="screen" /></cfoutput>
		<script src="common_files/prototype.js" type="text/javascript"></script>
		<script src="common_files/scriptaculous.js" type="text/javascript"></script>
		<style type="text/css">
		body {background-color:#000000; margin:0px;}
		body, table, td, form, input, select, h1, h2, h3, h4, h5, h6, pre {font-family:Arial; font-size:12px; color:#000000;}
		/* Netscape 4 font-size fix */
		html body, html table, html td, html input, html select, html h1, html h2, html h3, html h4, html h5, html h6 {font-size:11px;}
		body, form {margin:0px; padding:0px;}
		/* Modified to make default link behave like featureLnk */
		a {color:#006699;text-decoration:none;}
		</style>
		<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />
	</head>

	<body<cfif NOT findnocase("mobile", cgi.http_user_agent)> onLoad="new Effect.Grow('loginB');"</cfif>>
	<table cellpadding="0" cellspacing="0" border="0" width="100%" style="height: 100%" summary="Table displays login information">
		<tr valign="top" style="height: 65px">
			<td>
				<!-- [[ HEADER START ]] -->
				<table class="header" cellspacing="0" cellpadding="0" bgcolor="#cccccc" border="0" cols="2" width="100%" summary="Table displays login information">
					<tbody>
						<tr>
							<td valign="middle" width="50%"><img src="images/spacer.gif" border="0" alt="" width="366" height="1"><a href="#begin_page_content" title="Skip to content"><img src="images/spacer.gif" border="0" alt="" width="1" height="1"></a><br />
								<a href="http://www.nasa.gov/" target="_blank" title="NASA.gov homepage opens in a new window"><img height="51" alt="NASA-National Aeronautics and Space Administration" src="images/logo_nasa.gif" width="288" border="0" /></a></td>
							<td valign="middle" width="50%" height="65"><img src="images/spacer.gif" border="0" alt="" width="364" height="1"><br />
								<!-- [[ QUICK LINKS START ]] -->
								<table cellspacing="0" cellpadding="0" width="364" border="0" cols="3" summary="Table displays nasa links">
									<tbody>
										<tr>
											<td width="1" bgcolor="#666666"><img src="images/spacer.gif" height="45" alt="" width="1" border="0" /></td>
											<td width="19"> </td>
											<td width="344">
												<a class="headerLnk" href="http://www.nasa.gov/home/index.html">+ Visit NASA.gov</a><br />
												<a class="headerLnk" href="http://www.nasa.gov/about/contact/index.html">+ Contact NASA</a><br />
											</td>
										</tr>
									</tbody>
								</table>
								<!-- [[ QUICK LINKS END ]] -->
							</td>
						</tr>
					</tbody>
				</table>
				<!-- [[ HEADER END ]] -->
			</td>
		</tr>
		<tr valign="top">
			<td class="login_background">
				<table cellpadding="0" cellspacing="0" border="0" cols="2" summary="table displays warning about entering">
					<tr>
						<td colspan="2"><img src="images/spacer.gif" alt="" width="750" height="162" border="0"></td>
					</tr>
					<tr valign=top>
						<td width="200">
							<img src="images/spacer.gif" alt="" width="400" height="220" border="0"><br />
							<div style="position:relative;top:-170px;left:722px;width:200px;">
								<i>This <abbr title="Applied Internet Technologies">AIT</abbr> computer is for authorized users only.  By accessing this system you are consenting to complete monitoring with no expectation of privacy.  Unauthorized access or use may subject you to disciplinary action and criminal prosecution.</i>
							</div>
						</td>
						<td width="550">
							<a name="begin_page_content"></a>
							<div id="loginB" class="loginBox" style="display:none;">
								<div class="loginBoxBackground"> &nbsp; </div>
								<div class="loginBoxForeground">
<div id="mainbody" class="mainbody">