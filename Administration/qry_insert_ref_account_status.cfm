<!-- Administration/qry_insert_ref_account_status.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_account_status.cfm">
	<responsibilities>
		Query to insert a new record into REF_Account_Status table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/22/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_account_status" datasource="#application.datasources.main#">
INSERT INTO REF_Account_Status (description, sort_order, created_by,
	active_ind)
VALUES ('#attributes.description#', #attributes.sort_order#, #session.user_account_id#,
	#attributes.active_ind#)
</cfquery>