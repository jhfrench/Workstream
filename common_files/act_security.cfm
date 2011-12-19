<!-- common_files/act_security.cfm
	Author: Jeromy French -->
<cfsilent>
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_security.cfm">
	<responsibilities>
		I secure the application against some of the more common "hacking" techniques.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/21/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 5/16/11)
			Removing code that prevents users from following links from email that are read in hotmail, yahoo, etc (because those sites render the email into a web page which has a referer. Converting to cfscript to run faster (since this page runs with every page load).
			
			(JF | 6/1/11)
			Letting user know when they are being forced to log back in because the application was reset.
			
			(JF | 6/1/11)
			Attempting to be able to save user's form entries when making them login during the middle of a process. Ultimately not doable with all the cflocations used for logging in. Removed the effort.
			
			(JF | 6/16/11)
			Added handling of bad fuseactions.
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
	if (NOT isdefined("url.fuseaction")) {
		variables.fuseaction=application.fusebox.defaultfuseaction;
	}
	else {
		variables.fuseaction=xmlformat(url.fuseaction);
	}
	variables.page_not_found_ind=0;
	variables.locate_target="";	
	variables.error_message="";
	variables.new_location="";
	variables.current_location="#cgi.http_host##cgi.script_name#";
	
	if (NOT len(cgi.query_string)) {
		//if the user requests the root directory, redirect to the default fuseaction
		variables.locate_target="#variables.fuseaction#";
		//variables.scenario=1;
	}
	else {
		if ((listlen(variables.fuseaction, ".") NEQ 2) OR (NOT structkeyexists(myFusebox.getApplication().circuits, listfirst(variables.fuseaction, '.'))) OR (NOT structkeyexists(myFusebox.getApplication().circuits[listfirst(variables.fuseaction,'.')].fuseactions, listlast(variables.fuseaction, '.')))) {
			// fuseaction is invalid
			if (NOT (isdefined("cgi.http_referer") AND len(cgi.http_referer))) {
				//if we don't know the http_referer
				//1. Prevent from directly typing in url
				variables.error_message="You are being logged out due to a badly formed access attempt.1";
				variables.new_location="index.cfm?fuseaction=Home.logout";
				//variables.scenario=2;
			}
			else {
				//we do know the referer
				if (comparenocase(right(listfirst(cgi.http_referer,"?"),len(variables.current_location)), variables.current_location)) {
					variables.error_message="This is a United States of America government site. Any unauthenticated access is prohibited.1";
					variables.new_location="index.cfm?fuseaction=Home.logout&requested_page=#variables.fuseaction#";
					//variables.scenario=3;
				}
				else {
					//we like the referer; this is our bad link, so tell user and send them to the login page
					variables.page_not_found_ind=1;
					//variables.scenario=4;
				}
			}
		}
		else {
			if (listfindnocase(application.private_fuseactions, variables.fuseaction)) {
				//if the fuseaction is for one of the protected pages
	
				variables.page_is_secure_ind=1;
				//variables.scenario=5;
				if(NOT isdefined("session.user_account_id") AND comparenocase(variables.fuseaction,"Home.login")) {
					//if the user's user_account_id is not defined in the session scope and the fuseaction is not for the login page
					//variables.scenario=6;
					if (datediff("n", get_last_updated.last_updated, now()) LTE 5) {
						variables.error_message="The #application.html_title# was recently reset. Please login again to resume your session.";
						variables.new_location="index.cfm?fuseaction=Home.logout&requested_page=#variables.fuseaction#";
					}
					else {
						if (len(variables.fuseaction)) {
							//if we have a fuseaction in the URL
							//3. Prevent from navigating application after timed out or logged out
							if (find(variables.current_location, listfirst(cgi.http_referer,"?"))) {
								//if the refer is the same application, then the session has timed out
								variables.error_message="It looks like your session timed out (they only last #variables.sessiontimeout*24*60# minutes). Please login again.";
								//variables.scenario=7;
							}
							else {
								variables.error_message="Please login.";
								//variables.scenario=8;
							}
							variables.new_location="index.cfm?fuseaction=Home.logout&requested_page=#variables.fuseaction#";
							//variables.scenario=9;
						}
						else {
							//if we don't have a fuseaction in the URL
							variables.locate_target="Home.login&requested_page=#application.fusebox.defaultfuseaction#";
							//variables.scenario=10;
						}
					}
				}
				else {
					if (isdefined("session.application_page_redirect_ind")) {
						try {
							structdelete(session, "application_page_redirect_ind");
						}
						catch (any error_event) {}
						//variables.scenario=11;
					}
					else {
						if (NOT (isdefined("cgi.http_referer") AND len(cgi.http_referer))) {
							//if we don't know the http_referer
							//1. Prevent from directly typing in url
							variables.error_message="You are being logged out due to a badly formed access attempt.2";
							variables.new_location="index.cfm?fuseaction=Home.logout";
						}
						else {
							if (comparenocase(right(listfirst(cgi.http_referer,"?"),len(variables.current_location)), variables.current_location)) {
								//if the page request is not originating from the application's host server --->
								//2. Prevent unauthorized interface attempts from other applications --->
								variables.error_message="This is a United States of America government site. Any unauthenticated access is prohibited.2";
								variables.new_location="index.cfm?fuseaction=Home.logout&requested_page=#variables.fuseaction#";
								//variables.scenario=12;
							}
						}
					}
				}
			}
			else {
				//if we have a fuseaction in the URL and the fuseaction is not for one of the protected pages --->
				variables.page_is_secure_ind=0;
				//variables.scenario=13;
			}
		}
	}
</cfscript>
</cfsilent><!---
<cfoutput><h1>variables.scenario: #variables.scenario#<br>
variables.fuseaction: #variables.fuseaction#<br>
#variables.current_location# (variables.current_location)<br>
#right(listfirst(cgi.http_referer,"?"),len(variables.current_location))# (referer)</h1></cfoutput>
<cfabort> --->
<cfif len(variables.locate_target)>
	<cflocation url="index.cfm?fuseaction=#variables.locate_target#" addtoken="no">
<cfelseif len(variables.error_message)>
	<cfoutput>
	<html>
		<head>
			<title>#application.html_title#</title>
			<script language="javascript" type="text/javascript">
				alert("#variables.error_message#");
				window.location.href="#variables.new_location#";
			</script>
			<link href="http://www.nasa.gov/favicon.ico" rel="shortcut icon">
		</head>
		<body>
			<a href="#variables.new_location#">#variables.error_message#</a>
		</body>
	</html>
	</cfoutput>
	<cfabort>
<cfelseif variables.page_not_found_ind>
	<cfmodule template="../common_files/variable_check.cfm" check_variable="variables.no_such_variable" relocate="Home.home">
</cfif>