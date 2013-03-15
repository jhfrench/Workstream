<!-- Application_Manager/qry_update_page_request.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_update_page_request.cfm" Specification="2.0">
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

<cfquery name="update_page_request" datasource="#application.datasources.application_manager#">
UPDATE LOG_Page_Request
SET page_load_time=<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.page_load_time#">
WHERE page_request_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.page_request_id#">)
</cfquery>