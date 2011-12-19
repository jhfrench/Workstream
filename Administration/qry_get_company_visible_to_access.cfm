
<!--Admin/qry_get_Link_Company_Emp_Contact_access.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="get_link_company_emp_contact_access" datasource="#application.datasources.main#">
SELECT REF_Companies.company_id, REF_Companies.company, 
	CASE
		WHEN Link_Company_Emp_Contact.Link_Company_Emp_Contact_id IS NULL THEN '' 
		ELSE ' SELECTED'
	END AS has_company_access
FROM REF_Companies
	LEFT OUTER JOIN Link_Company_Emp_Contact ON REF_Companies.company_id=Link_Company_Emp_Contact.company_id
		AND Link_Company_Emp_Contact.emp_id=#attributes.emp_id#
ORDER BY REF_Companies.company, REF_Companies.company_id
</cfquery>
</cfsilent>

