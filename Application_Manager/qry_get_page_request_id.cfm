<!-- Application_Manager/qry_get_page_request_id.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_page_request_id.cfm" Specification="2.0">
	<responsibilities>
		I log the page request in the database. This data can then be compiled for reporting.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/25/2008" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="get_page_request_id" datasource="#application.datasources.application_manager#">
SELECT LOG_PAGE_REQUEST_SEQ.CURRVAL AS page_request_id
FROM Dual
</cfquery>
