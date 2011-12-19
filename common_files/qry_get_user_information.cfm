<!-- common_files/qry_get_user_information.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_information.cfm">
	<responsibilities>
	I get active users in the system
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 6/27/2006) Removing condition to user session.user_account_id if it exists; it always exists. If you want to get data for only one user, set attributes.user_account_id=session.user_account_id.
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

<cfquery name="get_user_information" datasource="#application.datasources.main#">
SELECT Demographics.demographics_id, Demographics.first_name, Demographics.last_name,
	Demographics.email_address, Demographics.work_phone, Demographics.center_id,
	Demographics.middle_initial, Demographics.uupic, User_Account.user_account_id,
	User_Account.user_name, Link_User_Account_Status.account_status_id, REF_Account_Status.description AS account_status,
	REF_Center.abbreviation AS center_abbreviation
FROM User_Account
	INNER JOIN Demographics ON User_Account.user_account_id=Demographics.user_account_id
	INNER JOIN Link_User_Account_Status ON User_Account.user_account_id=Link_User_Account_Status.user_account_id
	INNER JOIN REF_Account_Status ON Link_User_Account_Status.account_status_id=REF_Account_Status.account_status_id
	LEFT OUTER JOIN REF_Center ON Demographics.center_id=REF_Center.center_id
WHERE Demographics.active_ind=1
	AND Link_User_Account_Status.active_ind=1<cfif isdefined("attributes.user_account_id") AND len(attributes.user_account_id)>
	AND User_Account.user_account_id IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.user_account_id#" list="yes">)</cfif><cfif isdefined("attributes.last_initial") AND len(attributes.last_initial)>
	AND UPPER(Demographics.last_name) LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.last_initial#%"></cfif>
ORDER BY UPPER(Demographics.last_name), UPPER(Demographics.first_name), User_Account.user_name
</cfquery>