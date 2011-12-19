<!-- Administration/qry_insert_lock_module.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_lock_module.cfm">
	<responsibilities>
		I lock modules.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="8/9/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>
			
		</out>
	</IO>
</fusedoc>
--->

<cfquery name="insert_lock_module" datasource="#application.datasources.main#">
INSERT INTO Lock_Module (module_id, comments, created_by)
VALUES (#module_id_ii#, '#variables.module_comments#', #session.user_account_id#)
</cfquery>


