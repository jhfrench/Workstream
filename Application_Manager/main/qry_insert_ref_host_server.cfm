<!-- Application_Manager/main/qry_insert_ref_host_server.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_ref_host_server.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the REF_Host_Server table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_ref_host_server" datasource="#application.datasources.application_manager#">
INSERT INTO REF_Host_Server (host_server_name, sort_order)
VALUES ('#attributes.host_server_name#', 1)
</cfquery>