<!-- Application_Manager/qry_insert_page_request.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_page_request.cfm" Specification="2.0">
	<responsibilities>
		I log the page request in the database. This data can then be compiled for reporting.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/25/2008" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="insert_page_request" datasource="#application.datasources.application_manager#">
INSERT INTO LOG_Page_Request (url_requested, user_identification)
VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#cgi.http_host##cgi.script_name#?#cgi.query_string#">, <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.user_identification#">)
</cfquery>