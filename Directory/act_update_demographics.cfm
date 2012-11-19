
<!-- Directory/act_update_demographics.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the demographics record for an employee

	||
	Edits: 
	$Log$
	Revision 1.1  2006/07/17 07:14:13  french
	Modified code to ensure that employee updates don't cause duplicate demographic records.

	||
	Variables:

	END FUSEDOC --->
<cfquery name="delete_employee" datasource="#application.datasources.main#">
UPDATE Employee
SET active_ind=0
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id# 
</cfquery>

<cfinclude template="qry_insert_employee.cfm">
</cfsilent>