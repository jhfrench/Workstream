<!-- Application_Manager/main/qry_get_ref_host_server.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_ref_host_server.cfm" Specification="2.0">
	<responsibilities>
		I retrieve a list of servers that have been identified as capable of hosting (or serving) applications. This concept is separate from servers that provide database support.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_ref_host_server" datasource="#application.datasources.application_manager#">
SELECT *
FROM REF_Host_Server
WHERE active_ind=1
ORDER BY sort_order
</cfquery>