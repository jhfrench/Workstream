
<!--Directory/qry_insert_employee_account.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a employee.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
 --->
</cfsilent>
<cftransaction>
<cfquery name="insert_user_account" datasource="#application.datasources.main#">
INSERT INTO User_Account (user_name, account_type_id, created_by)
VALUES ('#left(attributes.first_name, 1)##left(attributes.middle_initial, 1)##attributes.last_name#', #attributes.account_type_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);
</cfquery>

<cfquery name="max_user_account_id" datasource="#application.datasources.main#">
SELECT CURRVAL('User_Account_user_account_id_SEQ') AS user_account_id
</cfquery>
</cftransaction>
<cfset variables.user_account_id=max_user_account_id.user_account_id>
<cfset attributes.user_account_id=variables.user_account_id>

<!--- initialize the account with a active status --->
<cfquery name="insert_link_user_account_status" datasource="#application.datasources.main#">
INSERT INTO Link_User_Account_Status (user_account_id, account_status_id, created_by)
VALUES (#attributes.user_account_id#, 1, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);
</cfquery>

<cfquery name="insert_demographics" datasource="#application.datasources.main#">
INSERT INTO Demographics (first_name, last_name, middle_initial,
	credentials, user_account_id, uupic,
	email_address, work_phone, created_by)
VALUES ('#attributes.first_name#', '#attributes.last_name#', '#attributes.middle_initial#',
	'#attributes.credentials#', #attributes.user_account_id#, '#attributes.uupic#',
	'#attributes.email_1#', '#attributes.phone_1#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);
</cfquery>
