<!-- errortemplates/act_setup_error_handling.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="act_setup_error_handling.cfm" Specification="2.0">
	<responsibilities>
		I set up the error-handling structure for an application.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfif isdefined("application.installation_id") AND NOT (isdefined("application.error_handling_enabled_ind") OR isdefined("application.email_server_name"))>
	<!--- see if error handling is enabled --->
	<cfquery name="qry_get_error_handling_enabled_ind" datasource="#application.datasources.main#">
	SELECT Installation.error_handling_enabled_ind, REF_Email_Server.email_server_name
	FROM Installation
		INNER JOIN REF_Email_Server ON Installation.email_server_id=REF_Email_Server.email_server_id
	WHERE Installation.installation_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#application.installation_id#">
	</cfquery>

	<cflock type="EXCLUSIVE" scope="APPLICATION" timeout="4">
		<cfif qry_get_error_handling_enabled_ind.recordcount GT 0>
			<cfset application.error_handling_enabled_ind=qry_get_error_handling_enabled_ind.error_handling_enabled_ind>
			<cfset application.email_server_name=qry_get_error_handling_enabled_ind.email_server_name>
		<cfelse>
			<cfset application.error_handling_enabled_ind=1>
			<cfset application.email_server_name="">
		</cfif>
	</cflock>
</cfif>

<cfif application.error_handling_enabled_ind>
	<cferror type="REQUEST" exception="any" template="error.html">
	<cferror type="EXCEPTION" template="error.cfm" mailto="kk" exception="any">
</cfif>