<!-- Application_Manager/qry_get_application_datasource.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_application_datasource.cfm" Specification="2.0">
	<responsibilities>
		I retrieve details about datasources used to support a given application.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<!--- Determine which installation's records we should pull based on the application.installation_id--->
<cfquery name="qry_get_application_datasource" cachedafter="02/02/1978" datasource="#application.datasources.application_manager#">
<!--- Following query used to get the database(s) that support(s) the application being used. It is a cached query controlled by the Application_Manager tool. --->
SELECT L_Installation_Supporting_DB.l_i_s_d_id, REF_Database_Type.database_type_name, REF_Database_Server.database_server_name, 
	L_Installation_Supporting_DB.datasource_name, Supporting_Database.database_name
FROM L_Installation_Supporting_DB
	INNER JOIN Supporting_Database ON L_Installation_Supporting_DB.supporting_database_id=Supporting_Database.supporting_database_id
	INNER JOIN REF_Database_Server ON L_Installation_Supporting_DB.database_server_id=REF_Database_Server.database_server_id
	INNER JOIN REF_Database_Type ON L_Installation_Supporting_DB.database_type_id=REF_Database_Type.database_type_id
WHERE L_Installation_Supporting_DB.active_ind=1
	AND Supporting_Database.active_ind=1
	AND REF_Database_Server.active_ind=1
	AND #variables.application_last_updated#=#variables.application_last_updated#
	AND L_Installation_Supporting_DB.installation_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#application.installation_id#">
</cfquery>