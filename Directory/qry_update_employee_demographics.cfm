
<!-- Directory/qry_update_employee_demographics.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the emp_contact table

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="update_emp_contact" datasource="#application.datasources.main#">
UPDATE Demographics
SET active_ind=0
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id#;
	
INSERT INTO Demographics (first_name, last_name, middle_initial,
	credentials, user_account_id)
VALUES ('#attributes.first_name#', '#attributes.last_name#', '#attributes.middle_initial#',
	'#attributes.credentials#', #attributes.user_account_id#);
	
UPDATE User_Account
SET account_type_id=#attributes.account_type_id#
WHERE user_account_id=#attributes.user_account_id#
	AND account_type_id!=#attributes.account_type_id#;
</cfquery>
</cfsilent>
