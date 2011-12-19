<!-- Application_Manager/Application.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="Application.cfm" Specification="2.0">
	<responsibilities>
		I run with every page load. I prevent users from accessing any template other than "index.cfm", coordinate the setting of application variables, handle the possibility of showing the user a friendly down message if application is inactive, and set up error handling.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfsilent>
<cfif comparenocase(right(cgi.script_name, len("index.cfm")), "index.cfm") AND comparenocase(right(cgi.script_name, 3),  "cfc")>
	<cflocation url="index.cfm" addtoken="no">
</cfif>
</cfsilent>


<cfset variables.path_prefix="Application_Manager/">
<cfapplication name="Application_Manager_date_2009-04-13"
	applicationtimeout="0.04166666666665"
	clientmanagement="no"
	clientstorage="registry"
	sessionmanagement="yes"
	sessiontimeout="0.04166666666665"
	setclientcookies="yes"
	setdomaincookies="no">
<cfset application.product_name="FAAD">
<cfset application.html_title="Federal Assistance Award Data">
<cfset application.active_ind="1">
<cfset application.erroremailfrom="FAAD@nasa.gov">
<cfset application.product_id="122">
<cfset application.support_email_recipients="">
<cfset application.installation_id="459">
<cfset application.last_updated="{ts '2009-04-06 20:03:00'}">
<cfset application.log_page_request_ind="1">
<cfset application.inactive_link="pag_application_unavailable.cfm">
<cfset application.host_server_name="Procyon">
<cfset application.login_for_error="session.last_name">
<cfset application.application_specific_settings.system_email_sender=application.erroremailfrom>
<cfset application.application_specific_settings.normal_navigation_ind=1>

<cfset application.application_specific_settings.system_email_sender=application.erroremailfrom>
<cfset application.application_specific_settings.assign_module_access_ind=0>
<cfset application.application_specific_settings.normal_navigation_ind=1>
<cfset application.application_specific_settings.show_comments_ind=1>
<cfset application.application_specific_settings.show_requirements_ind=1 >

<cfset application.browser_navigation_enabled_ind="1">
<cfset application.datasources.main="FAAD">

<cfswitch expression="#cgi.http_host#">
	<cfcase value="nash.hitsshq.com">
		<cfset application.error_handling_enabled_ind="1">
		<cfset application.email_server_name="bob">
		<cfset application.environment_name="Development">
		<cfset application.product_release_version="1.0">
	</cfcase>
	<cfcase value="procyon.sef.hq.nasa.gov">
		<cfset application.error_handling_enabled_ind="1">
		<cfset application.email_server_name="smtp.hq.nasa.gov">
		<cfset application.environment_name="SEF">
		<cfset application.product_release_version="1.0">
	</cfcase>
	<cfcase value="smith.hq.nasa.gov">
		<cfset application.error_handling_enabled_ind="1">
		<cfset application.email_server_name="smtp.hq.nasa.gov">
		<cfset application.environment_name="Production">
		<cfset application.product_release_version="1.0">
	</cfcase>
</cfswitch>

<!--- Error Handling --->
<cfinclude template="errortemplates/act_setup_error_handling.cfm">