<!--- $issue$: convert to insert_* --->
<!--Directory/qry_security_company_access_entry.cfm
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
<cfset variables.company_id=listappend(attributes.visable_company,attributes.company_id)>
<cfquery name="Security_Company_Access_entry" datasource="#application.datasources.main#">
INSERT INTO Security_Company_Access(user_account_id, company_id, created_by)
SELECT #variables.user_account_id#, company_id, #variables.user_identification#
FROM REF_Company
WHERE company_id IN (#variables.company_id#)
</cfquery>