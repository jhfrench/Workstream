
<!--Directory/qry_company_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a company record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
 --->
</cfsilent>
<cfquery name="company_entry" datasource="#application.datasources.main#">
INSERT INTO Link_Company_User_Account (user_account_id, company_id, created_by)
VALUES(#variables.user_account_id#, #attributes.company_id#, #variables.user_identification#)
</cfquery>

