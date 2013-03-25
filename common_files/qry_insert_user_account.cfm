<!-- common_files/qry_insert_user_account.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_user_account.cfm">
	<responsibilities>
	I insert username into user account table
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="insert_user_account" datasource="#application.datasources.main#">
INSERT INTO User_Account (user_name, created_by)
VALUES('#attributes.user_name#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfquery>