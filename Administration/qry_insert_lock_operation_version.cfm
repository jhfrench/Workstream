<!-- Administration/qry_insert_lock_operation_version.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_lock_operation_version.cfm">
	<responsibilities>

	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="3/31/2008" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_lock_operation_version" datasource="#application.datasources.main#">
	INSERT INTO lock_appropriation_version (appropriation_version_id, created_by)
	VALUES (#attributes.appropriation_version_id#, #session.user_account_id#)
</cfquery>