<!-- Application_Manager/main/qry_insert_supporting_database.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_supporting_database.cfm" Specification="2.0">
	<responsibilities>
		I create a new record in the Supporting_Database table, then retrieve the primary key (supporting_database_id) for that new record.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_supporting_database" datasource="#application.datasources.main#">
INSERT INTO Supporting_Database (database_name, datasource_description, created_date,
	active_ind)
SELECT '#evaluate("attributes.database_name_#database_count_ii#")#', '#evaluate("attributes.datasource_description_#database_count_ii#")#', CURRENT_TIMESTAMP,
	1
FROM Dual
</cfquery>

<cfquery name="qry_get_supporting_database_id" datasource="#application.datasources.main#">
SELECT MAX(supporting_database_id) AS supporting_database_id
FROM Supporting_Database
WHERE database_name='#evaluate("attributes.database_name_#database_count_ii#")#'
</cfquery>