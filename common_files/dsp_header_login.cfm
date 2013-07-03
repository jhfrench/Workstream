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

	<!-- pre-fetch some resources to make the app perform better-->
	<link rel="prefetch" href="//s3.amazonaws.com/Workstream/Workstream.css">
	<link rel="prefetch" href="//s3.amazonaws.com/Workstream/script.js">
	<link rel="prefetch" href="//s3.amazonaws.com/Workstream/images/spritepad_Workstream.png">
	<link rel="prefetch" href="//s3.amazonaws.com/external-projects/bootstrap/img/glyphicons-halflings.png">
	<link rel="prefetch" href="//s3.amazonaws.com/external-projects/bootstrap/img/glyphicons-halflings-white.png">
	<link rel="prefetch" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.0/jquery-ui.min.js">

	<script src="//s3.amazonaws.com/Workstream/modernizr.custom.40623.js"></script>
	<script type="text/javascript">
	//if Modernizr determines they can be supported, load the following CSS and JavaScript resources
	Modernizr.load([
		{
			both: [
				'//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js',
			],
			complete: function(){
				if ( !window.jQuery ) {
					Modernizr.load([
						{
							both: [
								'//s3.amazonaws.com/external-projects/jquery.min.js',
							]
						}
					]);
				};
			}
		},
		{
			load: [
				'//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js'
			],
			complete: function(){
				if ( !window.jQuery.support ) {
					Modernizr.load([
						{
							load: [
								'//s3.amazonaws.com/external-projects/bootstrap.min.js'
							]
						}
					]);
				}
			}
		},
		{
			// This will wait for the fallback to load and execute if it needs to.
			both: [
				'//s3.amazonaws.com/Workstream/plugins.js',
				'//s3.amazonaws.com/Workstream/clockTower.js'
			]
		}
	]);
	</script>
</head>
<body class="container-fluid">
