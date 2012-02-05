<!-- common_files/qry_get_username.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_username.cfm">
	<responsibilities>
	I get active usernames
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Omoniyi Fajemidupe" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_username" datasource="#application.datasources.main#">
SELECT User_Account.user_account_id, User_Account.user_name
FROM User_Account
	INNER JOIN Link_User_Account_Status ON User_Account.user_account_id=Link_User_Account_Status.user_account_id
WHERE Link_User_Account_Status.active_ind=1
	AND User_Account.user_name='#attributes.user_name#'
</cfquery>