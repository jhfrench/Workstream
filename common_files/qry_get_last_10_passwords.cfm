<!-- common_files/qry_get_last_10_passwords.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_last_10_passwords.cfm">
	<responsibilities>
		I get the last 10 passwords used.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_last_10_passwords" datasource="#application.datasources.main#">
SELECT *
FROM (
	SELECT password
	FROM User_Password
	WHERE user_account_id=#attributes.user_account_id#
	ORDER BY user_password_id DESC
	LIMIT 10
	) Data
WHERE password='#attributes.encrypted_password#'
</cfquery>