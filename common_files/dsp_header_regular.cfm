<!-- common_files/dsp_header_regular.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_header_regular.cfm">
	<responsibilities>
		I display a header that shows on most pages.
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
variables.icon_number=3; //variables.icon_number needs to be equal to the number of static icons in the navigation block
variables.access_message="";
variables.allowed_modules=valuelist(get_module_navigation.module_id);
if (NOT isdefined("session.text_size")) session.text_size="none";
if (variables.page_is_secure_ind AND listfind(get_screen_details.screen_access_ind,1) EQ 0)
	variables.access_message="Your access is not authorized for this screen.";
else
	if (listfind(get_screen_details.locked_ind,1)) {
		variables.access_message="This module has been locked.";
		if (len(get_screen_details.lock_module_comment))
			variables.access_message="#variables.access_message#<br />#get_screen_details.lock_module_comment#";
	}
</cfscript>
<cfmodule template="qry_get_system_note.cfm">

<cfoutput>
<html>
	<head>
		<title>#application.html_title#</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta http-equiv="expires" content="#now()#">
		<cfswitch expression="#session.text_size#">
			<cfcase value="alt2,alt3"><link href="common_files/#application.product_name#_#session.text_size#.css?cache_escape=#qry_get_last_updated.last_updated#" title="#session.text_size#" rel="stylesheet" type="text/css" media="screen" /></cfcase>
			<cfdefaultcase><link href="common_files/application.css?cache_escape=#qry_get_last_updated.last_updated#" rel="stylesheet" type="text/css" media="screen" /></cfdefaultcase>
		</cfswitch>

		<!--This script should appear below your LINK stylesheet tags -->
		<script src="styleswitch.js" type="text/javascript">
		/***********************************************
		* Style Sheet Switcher v1.1- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
		* This notice MUST stay intact for legal use
		* Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
		***********************************************/
		</script>
		<script src="common_files/prototype.js" type="text/javascript"></script>
		<script src="common_files/scriptaculous.js" type="text/javascript"></script>
		<script src="common_files/slider.js" type="text/javascript"></script>
		<script src="common_files/block.js" type="text/javascript"></script>
		<script type="text/javascript">
			//<![CDATA[
		var loadScr;
		var tempMessage;

		function scaleIcon(number)
		{
			initIcon();

			$('icon'+number).width=35;
			$('icon'+number).height=35;
			$('icon'+number).style.borderTop='3px double ##00c0ff';
			if (number==1)
			{
				$('icon'+(number+1)).width=25;
				$('icon'+(number+1)).height=25;
			}
			else
			{
				if (number==#get_module_navigation.recordcount+variables.icon_number#)
				{
					$('icon'+(number-1)).width=25;
					$('icon'+(number-1)).height=25;
				}
				else
				{
					$('icon'+(number-1)).width=25;
					$('icon'+(number-1)).height=25;
					$('icon'+(number+1)).width=25;
					$('icon'+(number+1)).height=25;
				}
			}
		
		}

		function initIcon()
		{
		<cfloop from="1" to="#get_module_navigation.recordcount+variables.icon_number#" index="icon_ii">
			$('icon#icon_ii#').height=17;
			$('icon#icon_ii#').width=17;
			$('icon#icon_ii#').style.borderTop='0px';
		</cfloop>
		}

		function checkTrack()
		{
			if ($('mcommands').getHeight() > 323) {
				Element.show('track_modulebar');
			}
			else {
				Element.hide('track_modulebar');
			}
		}

		//this is where we fade the system messages in and out
		function fadeMessages()
			{
				var temp;
				if (message_count > 0)
				{
					new Effect.Parallel( [ new Effect.Fade('ad_area') ], { duration: 
		0.5, queue:'end', afterFinish: function(effect)
					{
							temp=global_ad_message[tempMessage];
							$('ad_message').innerHTML=temp.truncate(200);
							$('ad_owner').innerHTML=global_ad_owner[tempMessage];
							$('ad_date').innerHTML=global_ad_date[tempMessage];
						}
					});
					new Effect.Appear('ad_area', {queue:'end'});
					tempMessage++;
					if (tempMessage > (message_count-1)) { tempMessage=0 }
				}
				else
				{ Element.hide('ad_area'); }
			}
		var global_ad_message=$A([<cfloop query="get_system_note">'#jsstringformat(left(note_text,200))#'<cfif get_system_note.currentrow NEQ get_system_note.recordcount>,</cfif></cfloop>]);
		var global_ad_owner=$A([<cfloop query="get_system_note">'#created_by#'<cfif get_system_note.currentrow NEQ get_system_note.recordcount>,</cfif></cfloop>]);
		var global_ad_date=$A([<cfloop query="get_system_note">'#dateformat(created_date,"mm/dd/yyyy")#'<cfif get_system_note.currentrow NEQ get_system_note.recordcount>,</cfif></cfloop>]);
		var message_count=<cfoutput>#get_system_note.recordcount#</cfoutput>;
	
		function startup()
		{
			tempMessage=1;
			//specifies which icon to make big on load
			scaleIcon(<cfif get_screen_details.business_function_id EQ 19>1<cfelse>#listfind(variables.allowed_modules,get_screen_details.module_id)+3#</cfif>);
			loadScr=$('mcommands').innerHTML;
			Element.hide('track_modulebar');
			//specifies the default submenu
			new Ajax.Updater('mcommands','<cfif listfind("19,115",get_screen_details.business_function_id)>index.cfm?fuseaction=Home.forum_commands&cache_escape=#variables.cache_escape#<cfelse>index.cfm?fuseaction=Home.module_commands&module_id=#get_screen_details.module_id#</cfif>',{method:'get',evalScripts:true});
		}

		//initiate message fader
		new PeriodicalExecuter(fadeMessages, 15);
		</script>
	</head>
	<body onLoad="Element.hide('help_area');<cfif application.application_specific_settings.normal_navigation_ind EQ 0>startup();</cfif><cfif len(get_screen_details.body_onload)>#get_screen_details.body_onload#</cfif>" bgcolor="##FFFFFF" text="##000000" link="##003399" alink="##003399" vlink="##003399">
	<div style="position:absolute;top:-100em;left:-100em;">
		<a href="##begin_page_content" title="hidden browser link to skip repetitive navigation"></a><cfloop query="get_hidden_navigation_links">
		<a href="index.cfm?fuseaction=#fuseaction###begin_page_content" title="hidden browser link to view #business_function_description#"></a></cfloop>
	</div>
	<cfinclude template="dsp_navigation_module_focus.cfm">

	<cfif application.application_specific_settings.normal_navigation_ind>
		<cfinclude template="qry_get_module_sub_navigation.cfm">
		<cfinclude template="dsp_navigation_sub.cfm"><!---
	<cfelse>
		<cfinclude template="dsp_abnormal_navigation_sub.cfm"> --->
	</cfif>
	<div id="mainbody" class="mainbody" style="padding-top:0px">
		<table cellspacing="0" cellpadding="0" border="0" cols="3"<cfif get_screen_details.business_function_id NEQ 19> width="100%"</cfif> summary="Organizes the page's content">
		<cfif get_screen_details.business_function_id EQ 19>
			<tr>
				<td colspan="3" align="center">
					<div style="padding-bottom:8px;font-size:11pt;"><strong>Welcome to the #application.application_specific_settings.nasa_organization# #application.html_title# (#application.product_name#).</strong></div>
				</td>
			</tr>
		</cfif>
			<tr valign="top">
				<td valign="top" width="<cfif get_screen_details.business_function_id EQ 19>265<cfelse>1%</cfif>" align="left" id="Main_bar">
				<!--- show this screen only if the user has created their own password --->
				<cfif variables.reset_password_ind EQ 0>
					<cfinclude template="../common_files/dsp_Main_navigation.cfm">
				</cfif>
				</td>
				<td valign="top" width="<cfif get_screen_details.business_function_id EQ 19>530<cfelse>98%</cfif>">
	
<!-- START MAIN BODY -->
<a name="begin_page_content"></a>
<div style="<cfif get_screen_details.business_function_id EQ 19>width:530px;height:100%;<cfelse>padding-left:0px;padding-right:16px;</cfif>" id="desktop">

<!--- if user does not have access to this fuseaction, tell them and abort processing --->
<cfif len(variables.access_message)>
	#variables.access_message#
	<cfinclude template="dsp_footer.cfm">
	<cfabort>
</cfif>
</cfoutput>
