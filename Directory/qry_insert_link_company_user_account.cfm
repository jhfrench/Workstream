
<!--Directory/qry_insert_link_company_user_account.cfm
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
<cfquery name="insert_link_company_user_account" datasource="#application.datasources.main#">
INSERT INTO Link_Company_User_Account (user_account_id, company_id, created_by)
VALUES(#variables.user_account_id#, #attributes.company_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfquery>