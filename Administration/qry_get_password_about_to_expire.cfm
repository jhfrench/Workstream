<!-- Administration/qry_get_password_about_to_expire.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_password_about_to_expire.cfm">
	<responsibilities>
		I get the passwords that are about to expire.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/07/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_password_about_to_expire" datasource="#application.datasources.main#">
SELECT Demographics.last_name, Demographics.first_name, Demographics.email_address,
	User_Password.user_account_id, 90-(DATEDIFF(D, User_Password.created_date, CURRENT_TIMESTAMP)) AS days_to_password_expire, User_Account.user_name
FROM User_Password
	INNER JOIN Demographics ON User_Password.user_account_id=Demographics.user_account_id
	INNER JOIN User_Account ON User_Password.user_account_id=User_Account.user_account_id
	INNER JOIN Link_User_Account_Status ON User_Password.user_account_id=Link_User_Account_Status.user_account_id
WHERE User_Password.active_ind=1
	AND Demographics.active_ind=1
	AND Link_User_Account_Status.active_ind=1
	AND Link_User_Account_Status.account_status_id=1
	AND 90-(DATEDIFF(D, User_Password.created_date, CURRENT_TIMESTAMP)) IN (30, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
</cfquery>

