
<!--Directory/qry_Link_Company_Emp_Contact_entry.cfm
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
	<!--- 
	If the admin granted the new user  access to multiple companies then 
	grant that access
	--->
<cfset variables.linked_company_id=listappend(attributes.company_id, attributes.visable_company)>
<cfquery name="Link_Company_Emp_Contact_entry" datasource="#application.datasources.main#">
INSERT INTO Link_Company_Emp_Contact (emp_id, company_id)
SELECT #variables.emp_id# AS emp_id, REF_Company.company_id
FROM REF_Company
WHERE REF_Company.company_id IN (#variables.linked_company_id#)
</cfquery>