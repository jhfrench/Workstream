<!-- common_files/qry_get_user_information_profile.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_information_profile.cfm">
	<responsibilities>
		get user information
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/3/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_user_information_profile" datasource="#application.datasources.main#">
SELECT Demographics.demographics_id, Demographics.first_name, Demographics.middle_initial,
	Demographics.last_name, Demographics.email_address, Demographics.work_phone,
	Demographics.center_id, User_Account.user_account_id, User_Account.user_name,
	Link_User_Account_Status.account_status_id, REF_Account_Status.description AS account_status, REF_Center.abbreviation AS center_abbreviation
FROM User_Account
	INNER JOIN Demographics ON User_Account.user_account_id=Demographics.user_account_id
	INNER JOIN Link_User_Account_Status ON User_Account.user_account_id=Link_User_Account_Status.user_account_id
	INNER JOIN REF_Account_Status ON Link_User_Account_Status.account_status_id=REF_Account_Status.account_status_id
	LEFT OUTER JOIN REF_Center ON Demographics.center_id=REF_Center.center_id
WHERE Demographics.active_ind=1
	AND Link_User_Account_Status.active_ind=1
	AND user_account_id=<cfif isdefined("variables.user_identification")><cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" /><cfelse>#get_username.user_account_id#</cfif>
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>