<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<!-- sourcecode/Application.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="Application.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/31/2007" role="FuseCoder" comments="Created File">
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

<!--- if broswer is requesting something other than index.cfm or a cfc, redirect them to index.cfm --->
<cfsilent>
	<cfif comparenocase(right(cgi.script_name, 9), "index.cfm") AND comparenocase(right(cgi.script_name, 3), "cfc")>
		<cflocation url="index.cfm" addtoken="no" />
	</cfif>
</cfsilent>

<!--- code re-use disabled at direction of HITSS management
<!--- development does not use https; SEF and production do --->
<cfif NOT len(cgi.https) OR NOT comparenocase(cgi.https,"off")>
	<cfset variables.path_prefix="../../Application_Manager/trunk/">
<cfelse>
	<cfset variables.path_prefix="../Application_Manager/">
</cfif>

<!--- use Application_Manager to get installation-specific settings (which we'll set in the application scope) --->
<cfinclude template="#variables.path_prefix#act_application_settings.cfm"> --->

<cfscript>
	variables.datasources.application_manager="Application_Manager";
	variables.path_prefix="Application_Manager/";
		
	switch(cgi.http_host) {
		case "127.0.0.1:8500":
		case "nash.hitsshq.com":
		case "faad.hitsshq.com": {
			variables.environment_name="Development";
			variables.sessiontimeout="3";
			break;
		}
		
		case "procyon.sef.hq.nasa.gov":
		case "faad.sef.hq.nasa.gov": {
			variables.environment_name="SEF";
			variables.sessiontimeout="0.04166666666665";
			break;
		}
		
		case "heckler.hq.nasa.gov":
		case "faad.hq.nasa.gov":
		case "faad.nasa.gov": {
			variables.environment_name="Production";
			variables.sessiontimeout="0.04166666666665";
			break;
		}
	}
</cfscript>
	
<cfquery name="get_last_updated" datasource="#variables.datasources.application_manager#">
SELECT last_updated
FROM Last_Updated
</cfquery>

<cfapplication name="skeleton_#dateformat(get_last_updated.last_updated,'yyyy_mm_dd')#_#timeformat(get_last_updated.last_updated,'HH:MM')#_#left(cgi.script_name,38)#"
	applicationtimeout="3"
	clientmanagement="no"
	clientstorage="registry"
	sessionmanagement="yes"
	sessiontimeout="#variables.sessiontimeout#"
	setclientcookies="yes"
	setdomaincookies="no">

<cfinclude template="app_cf_settings.cfm">

<!--- If the installation is inactive, show the user the friendly "down" message and stop processing. --->
<cfif application.active_ind EQ 0>
	<cfinclude template="#application.inactive_link#">
	<cfabort>
</cfif>

<!--- Error Handling --->
<cfinclude template="#variables.path_prefix#errortemplates/act_setup_error_handling.cfm">

<!--- if configured to do so on the Installation table, log page requests --->
<cfif application.log_page_request_ind>
	<cfif isdefined("session.user_account_id")>
		<cfset variables.user_identification=session.user_account_id>
	<cfelse>
		<cfset variables.user_identification="unknown">
	</cfif>
	<cfmodule template="#variables.path_prefix#act_log_page_request.cfm" log_type_id="1" user_identification="#variables.user_identification#">
</cfif>

<cfset request.dir_level="">
<!--- for manually setting application variables, instead of having them reside in a database

<cfdump var="#application.application_specific_settings#">
</cfdump>
<cfabort>

<cfoutput>
<cfloop collection="#application#" item="key">
<cfif NOT listfindnocase("application_specific_settings,application_support_contacts,datasources,fusebox", key)>
&lt;cfset application.#key#="#application[key]#"&gt;<br />
</cfif>
</cfloop>
</cfoutput> --->