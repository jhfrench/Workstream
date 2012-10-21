<!-- common_files/dsp_header_pop_up.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_header_pop_up.cfm">
	<responsibilities>
		I am the header for pop-up (and AJAX-included) windows.
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
	<cfinclude template="qry_get_user_access.cfm">
	<cfinclude template="qry_get_screen_details.cfm">

	<!--- are required variables defined? If not, tell user to change bookmarks --->
	<cfif len(get_screen_details.check_variable) AND len(get_screen_details.relocate)>
		<cfmodule template="variable_check.cfm" check_variable="#get_screen_details.check_variable#" relocate="#get_screen_details.relocate#">
	</cfif>
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

	<div class="row-fluid">
		<section id="content_container" role="main" class="span12">
</cfoutput>