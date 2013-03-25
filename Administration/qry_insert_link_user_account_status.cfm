<!-- Administration/qry_insert_link_user_account_status.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_user_account_status.cfm">
	<responsibilities>
		Query to insert a record into Link_User_Account_Status table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_link_user_account_status" datasource="#application.datasources.main#">
INSERT INTO Link_User_Account_Status (user_account_id, account_status_id, created_by,
	active_ind)
VALUES ('#attributes.user_account_id#', #attributes.account_status_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />,
	#attributes.active_ind#)
</cfquery>