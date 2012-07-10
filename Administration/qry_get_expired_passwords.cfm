<!-- Administration/qry_get_expired_passwords.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_expired_passwords.cfm">
	<responsibilities>
		I get the passwords that are about to expire.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_expired_passwords" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.email_address, User_Account.user_name
FROM User_Password
	INNER JOIN Demographics ON User_Password.user_account_id=Demographics.user_account_id
	INNER JOIN User_Account ON User_Password.user_account_id=User_Account.user_account_id
	INNER JOIN Link_User_Account_Status ON User_Password.user_account_id=Link_User_Account_Status.user_account_id
WHERE User_Password.active_ind=1
	AND Demographics.active_ind=1
	AND Link_User_Account_Status.active_ind=1
	AND Link_User_Account_Status.account_status_id=1
	AND 90-(DATEDIFF(D, User_Password.created_date, CURRENT_TIMESTAMP)) BETWEEN -179 AND 1
</cfquery>