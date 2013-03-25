<!-- Administration/qry_insert_link_module_privilege.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_module_privilege.cfm">
	<responsibilities>
		Query to insert a record into Link_Module_Privilege table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/9/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_link_module_privilege" datasource="#application.datasources.main#">
INSERT INTO Link_Module_Privilege (module_id, privilege_id, created_by,
	active_ind)
VALUES ('#attributes.module_id#', #attributes.privilege_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />,
	#attributes.active_ind#)
</cfquery>