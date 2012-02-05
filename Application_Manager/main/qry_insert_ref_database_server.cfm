<!-- Application_Manager/main/qry_insert_ref_database_server.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_ref_database_server.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the REF_Database_Server table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_ref_database_server" datasource="#application.datasources.main#">
INSERT INTO REF_Database_Server (database_server_name, sort_order)
VALUES ('#attributes.database_server_name#', 1)
</cfquery>