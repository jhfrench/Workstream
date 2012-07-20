<!-- common_files/qry_get_user_password.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_password.cfm">
	<responsibilities>
	I get the active password of a user.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/6/7) Renamed template to reflect table name.
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

<cfquery name="get_user_password" datasource="#application.datasources.main#">
SELECT User_Password.password, User_Password.created_date, User_Account.created_date AS account_created_date,
	Demographics.last_name, Demographics.first_name
FROM User_Password
	INNER JOIN User_Account ON User_Password.user_account_id=User_Account.user_account_id
	LEFT OUTER JOIN Demographics ON User_Password.created_by=Demographics.user_account_id
WHERE User_Password.active_ind=1
	AND User_Account.user_account_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.user_account_id#">
</cfquery>