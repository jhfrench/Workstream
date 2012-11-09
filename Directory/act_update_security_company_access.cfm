
<!-- Directory/act_update_Security_Company_Access.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the company visible to table.

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="Security_Company_Access_delete" datasource="#application.datasources.main#">
DELETE FROM Security_Company_Access
WHERE user_account_id=#attributes.user_account_id#
</cfquery>
<cfset variables.visible_company_id=listappend(attributes.company_id,attributes.visable_company)>
<cfquery name="Security_Company_Access_entry" datasource="#application.datasources.main#">
INSERT INTO Security_Company_Access(user_account_id, company_id)
SELECT #attributes.user_account_id# AS user_account_id, company_id
FROM REF_Company
WHERE company_id IN (#variables.visible_company_id#)
</cfquery>
</cfsilent>
