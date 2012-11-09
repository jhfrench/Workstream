
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
<cfquery name="emp_contact_entry" datasource="#application.datasources.main#">
INSERT INTO Emp_Contact (name, mi, lname,
	credentials, emp_contact_type)
VALUES('#attributes.name#', '#attributes.mi#', '#attributes.lname#',
	'#attributes.credentials#', #emp_contact_type#)
</cfquery>
<cfquery name="max_user_account_id" datasource="#application.datasources.main#">
SELECT CURRVAL('Emp_Contact_user_account_id_SEQ') AS user_account_id
</cfquery>
<cfset variables.user_account_id=max_user_account_id.user_account_id>
<cfset attributes.user_account_id=variables.user_account_id>
<!--- 
<cfquery name="emp_contact_delete" datasource="#application.datasources.main#">
DELETE Emp_Contact
WHERE user_account_id=#variables.user_account_id#
</cfquery>
 --->
