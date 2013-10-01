<!--Directory/qry_insert_security_company_access.cfm
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
<cfset variables.company_id=listappend(attributes.visible_company_id,attributes.company_id)>
<cfquery name="insert_security_company_access" datasource="#application.datasources.main#">
INSERT INTO Security_Company_Access(user_account_id, company_id, created_by)
SELECT <cfqueryparam value="#variables.user_account_id#" cfsqltype="cf_sql_integer" />, company_id, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
FROM REF_Company
WHERE company_id IN (<cfqueryparam value="#variables.company_id#" cfsqltype="cf_sql_integer" list="true" />)
</cfquery>