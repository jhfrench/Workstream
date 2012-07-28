
<!-- Directory/act_update_security_company_access.cfm
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
<cfquery name="security_company_access_delete" datasource="#application.datasources.main#">
DELETE Security_Company_Access
WHERE emp_id=#attributes.emp_id#
</cfquery>
<cfset variables.visible_company_id=listappend(attributes.company_id,attributes.visable_company)>
<cfquery name="security_company_access_entry" datasource="#application.datasources.main#">
INSERT INTO Security_Company_Access(emp_id, company_id)
SELECT #attributes.emp_id# AS emp_id, company_id
FROM REF_Company
WHERE company_id IN (#variables.visible_company_id#)
</cfquery>
</cfsilent>
