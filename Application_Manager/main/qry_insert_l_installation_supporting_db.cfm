<!-- Application_Manager/main/qry_insert_l_installation_supporting_db.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_l_installation_supporting_db.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the L_Installation_Supporting_DB table. This table is a crosswalk table that links Installation records with one or more Supporting_Database records.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_l_installation_supporting_db" datasource="#application.datasources.main#">
INSERT INTO L_Installation_Supporting_DB (installation_id, supporting_database_id, database_server_id,
	datasource_name, date_created, active_ind)
SELECT #attributes.installation_id#, #attributes.supporting_database_id#, #evaluate("attributes.database_server_id_#database_count_ii#")#,
	'#evaluate("attributes.datasource_name_#database_count_ii#")#', GETDATE(), 1
FROM Dual
</cfquery>