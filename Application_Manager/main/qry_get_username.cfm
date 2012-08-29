<!-- main/qry_get_username.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_username.cfm">
	<responsibilities>
		I get user information (id, status, etc.) from the system.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_username" datasource="#application.datasources.application_manager#">
SELECT User_Account.user_account_id, Link_User_Account_Status.account_status_id, User_Password.password,
	User_Account.created_date AS password_created_date, User_Password.created_by AS password_created_by, Demographics.first_name,
	Demographics.last_name, Demographics.email_address, User_Account.user_name
FROM User_Account
	INNER JOIN Link_User_Account_Status ON User_Account.user_account_id=Link_User_Account_Status.user_account_id
	INNER JOIN User_Password ON User_Account.user_account_id=User_Password.user_account_id
	INNER JOIN Demographics ON User_Account.user_account_id=Demographics.user_account_id
WHERE Link_User_Account_Status.active_ind=1
	AND User_Password.active_ind=1
	AND Demographics.active_ind=1
	AND Link_User_Account_Status.account_status_id=1
	AND User_Account.user_name='#trim(attributes.user_name)#'
</cfquery>