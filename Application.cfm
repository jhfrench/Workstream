<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<!-- sourcecode/Application.cfm
	Author: Jeromy French -->
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
	variables.datasources.application_manager="NVDB";
	variables.path_prefix="Application_Manager/";
		
	switch(cgi.http_host) {
		case "nash.hitsshq.com":
		case "nvdb.hitsshq.com": {
			variables.environment_name="Development";
			variables.sessiontimeout="3";
			variables.modules_allowed="1,2,4,5";
			variables.mast_image_name="mast.jpg";
			break;
		}
		
		case "vendors.nvdb.hitsshq.com": {
			variables.environment_name="Development";
			variables.sessiontimeout="3";
			variables.modules_allowed="1,3";
			variables.mast_image_name="mast2.jpg";
			break;
		}
		
		case "bronze.sef.hq.nasa.gov": {
			variables.environment_name="SEF";
			variables.sessiontimeout="0.04166666666665";
			variables.modules_allowed="1,2,4,5";
			variables.mast_image_name="mast.jpg";
			variables.datasources.application_manager="NVDB_Security";
			break;
		}
		
		case "nvdb.sef.hq.nasa.gov": {
			variables.environment_name="SEF";
			variables.sessiontimeout="0.04166666666665";
			variables.modules_allowed="1,2,4,5";
			variables.mast_image_name="mast.jpg";
			break;
		}
		
		case "vendors.nvdb.sef.hq.nasa.gov": {
			variables.environment_name="SEF";
			variables.sessiontimeout="0.04166666666665";
			variables.modules_allowed="1,3";
			variables.mast_image_name="mast2.jpg";
			break;
		}
		
		case "brass.hq.nasa.gov":
		case "nvdb.hq.nasa.gov":
		case "nvdb.nasa.gov": {
			variables.environment_name="Production";
			variables.sessiontimeout="0.04166666666665";
			variables.modules_allowed="1,2,4,5";
			variables.mast_image_name="mast.jpg";
			break;
		}
		
		case "vendors.nvdb.hq.nasa.gov":
		case "vendors.nvdb.nasa.gov": {
			variables.environment_name="Production";
			variables.sessiontimeout="0.04166666666665";
			variables.modules_allowed="1,3";
			variables.mast_image_name="mast2.jpg";
			break;
		}
	}
</cfscript>
	
<cftry>
	<cfquery name="get_last_updated" datasource="#variables.datasources.application_manager#">
	SELECT last_updated
	FROM Last_Updated
	</cfquery>
	<cfset variables.last_updated=get_last_updated.last_updated>
	
	<cfcatch type="database">
		<!--- if CF can't talk to the database, let's at least get the application to the point that it can activate the error-handling --->
		<cfset variables.last_updated=now()>
	</cfcatch>
</cftry>

<cfapplication name="NVDB_#dateformat(variables.last_updated,'yyyy_mm_dd')#_#timeformat(variables.last_updated,'HH:MM')#_#left(cgi.script_name,42)#"
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