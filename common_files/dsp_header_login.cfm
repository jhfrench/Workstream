<!-- common_files/dsp_header_login.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_header_login.cfm">
	<responsibilities>
		I display a header for the login page.
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

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js" lang="en"> <![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<cfoutput><title>#application.product_name#</title>
	<meta name="description" content="Applied Internet Technologies timekeeping software">
	<meta name="author" content="Applied Internet Technologies: #application.application_specific_settings.official#">
	<meta http-equiv="expires" content="#gethttptimestring(now())#" /></cfoutput>

	<meta name="viewport" content="width=device-width">

	<link href="images/workstream_icon.ico" rel="SHORTCUT ICON" />
	<link rel="stylesheet" href="common_files/Workstream.css">

	<script src="common_files/js/libs/modernizr-2.5.3-respond-1.1.0.min.js"></script>
	<script type="text/javascript">
		//if Modernizr determines they can be supported, load the following CSS and JavaScript resources
		Modernizr.load([
			{
				load: [
					'//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js'
				],
				complete: function () {
					if ( !window.jQuery ) {
						Modernizr.load('common_files/js/libs/jquery.min.js');
					}
				}
			},
			{
				// This will wait for the fallback to load and execute if it needs to.
				load: [
					'//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js',
					'//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min.js',
					'common_files/js/plugins.js',
					'common_files/js/script.js'
				]
			}
		]);
	</script>
</head>
<body class="container-fluid login_background">
<div id="login_box">
	<em class="lead">
		This <abbr title="Applied Internet Technologies">AIT</abbr> system is for authorized users only.  By accessing this system you are consenting to complete monitoring with no expectation of privacy.  Unauthorized access or use may subject you to disciplinary action and criminal prosecution.
	</em>
	<div id="login_form">
