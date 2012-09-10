<!DOCTYPE html>
<!-- sourcecode/Application.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="Application.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/31/2007" role="FuseCoder" comments="Created File">
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

<!--- use Application_Manager to get installation-specific settings (which we'll set in the application scope) --->
<cfinclude template="Application_Manager/act_application_settings.cfm">

<cfinclude template="app_cf_settings.cfm">

<!--- If the installation is inactive, show the user the friendly "down" message and stop processing. --->
<cfif application.active_ind EQ 0>
	<cfinclude template="#application.inactive_link#">
	<cfabort>
</cfif>

<!--- Error Handling --->
<cfinclude template="Application_Manager/errortemplates/act_setup_error_handling.cfm">

<cfif isdefined("session.user_account_id")>
	<cfset variables.user_identification=session.user_account_id>
<cfelse>
	<cfset variables.user_identification="unknown">
</cfif>

<!--- if configured to do so on the Installation table, log page requests --->
<cfif application.log_page_request_ind>
	<cfmodule template="Application_Manager/act_log_page_request.cfm" log_type_id="1" user_identification="#variables.user_identification#">
</cfif>