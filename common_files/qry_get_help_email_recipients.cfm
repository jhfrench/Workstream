<!-- common_files/qry_get_help_email_recipients.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_help_email_recipients.cfm">
	<responsibilities>
		I retrieve a comma-delimited list of the Help module administrators (users who have the ability to manage the help module).
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_help_email_recipients" datasource="#application.datasources.main#">
SELECT MIN(Demographics.demographics_id) AS demographics_id, Demographics.email_address
FROM Demographics
	INNER JOIN Access_User_Business_Function ON Demographics.user_account_id=Access_User_Business_Function.user_account_id
	INNER JOIN REF_Business_Function ON Access_User_Business_Function.business_function_id=REF_Business_Function.business_function_id
	INNER JOIN LINK_User_Account_Status ON Demographics.user_account_id=LINK_User_Account_Status.user_account_id
		AND LINK_User_Account_Status.account_status_id=1
WHERE Demographics.active_ind=1
	AND Access_User_Business_Function.active_ind=1
	AND REF_Business_Function.active_ind=1
	AND LINK_User_Account_Status.active_ind=1
	AND REF_Business_Function.description='Manage Help Module'
GROUP BY Demographics.email_address
ORDER BY Demographics.email_address
</cfquery>
<cfset variables.help_email_recipients=valuelist(get_help_email_recipients.email_address)>