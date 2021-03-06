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

	<link href="//s3.amazonaws.com/Workstream/images/workstream_icon.ico" rel="SHORTCUT ICON" />
	<link rel="stylesheet" href="//s3.amazonaws.com/Workstream/Workstream_Login.css">

	<script src="//s3.amazonaws.com/Workstream/Workstream.min.js"></script>
	<script src="//s3.amazonaws.com/Workstream/clockTower.js"></script>

	<!-- pre-fetch some images to make the app perform better -->
	<link rel="prefetch prerender next" href="//s3.amazonaws.com/Workstream/Workstream.min.css">
	<link rel="prefetch prerender next" href="//s3.amazonaws.com/Workstream/images/spritepad_Workstream.png">
	<link rel="prefetch prerender next" href="//s3.amazonaws.com/external-projects/bootstrap/img/glyphicons-halflings.png">
	<link rel="prefetch prerender next" href="//s3.amazonaws.com/external-projects/bootstrap/img/glyphicons-halflings-white.png">
</head>
<body class="container-fluid">
