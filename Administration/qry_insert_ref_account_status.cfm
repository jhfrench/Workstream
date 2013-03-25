<!-- Administration/qry_insert_ref_account_status.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_account_status.cfm">
	<responsibilities>
		Query to insert a new record into REF_Account_Status table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/22/2007" role="FuseCoder" comments="Created File">
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
VALUES ('#attributes.description#', #attributes.sort_order#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />,
	#attributes.active_ind#)
</cfquery>