<!-- common_files/qry_insert_user_account.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_user_account.cfm">
	<responsibilities>
	I insert username into user account table
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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
VALUES('#attributes.user_name#', #session.user_account_id#)
</cfquery>