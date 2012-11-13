
<!--Directory/qry_emp_contact_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a emp_contact record.
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
INSERT INTO User_Account (user_name, account_type_id)
VALUES ('#attributes.last_name##left(attributes.first_name, 1)#', 1);
</cfquery>
	
<cfquery name="max_user_account_id" datasource="#application.datasources.main#">
SELECT CURRVAL('User_Account_user_account_id_SEQ') AS user_account_id
</cfquery>
</cftransaction>
<cfset variables.user_account_id=max_user_account_id.user_account_id>
<cfset attributes.user_account_id=variables.user_account_id>

<cfquery name="insert_demographics" datasource="#application.datasources.main#">
INSERT INTO Demographics (first_name, last_name, middle_initial,
	credentials, user_account_id)
VALUES ('#attributes.first_name#', '#attributes.last_name#', '#attributes.middle_initial#',
	'#attributes.credentials#', #attributes.user_account_id#);
</cfquery>
