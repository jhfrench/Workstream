<!-- Application_Manager/main/qry_insert_installation.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_installation.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the Installation table. I then return the primary key for that new record.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfset variables.application_name="Application_Temp#now()#">
<cfquery name="qry_insert_installation" datasource="#application.datasources.application_manager#">
INSERT INTO Installation (application_name, email_server_id, environment_id,
	host_server_id, product_id, created_date,
	active_ind)
SELECT '#variables.application_name#', #attributes.email_server_id#, #attributes.environment_id#, 
	#attributes.host_server_id#, #attributes.product_id#, CURRENT_TIMESTAMP,
	1
FROM Dual
</cfquery>

<cfquery name="qry_get_installation_id" datasource="#application.datasources.application_manager#">
SELECT CURRVAL('Installation_installation_id_SEQ') AS installation_id
</cfquery>