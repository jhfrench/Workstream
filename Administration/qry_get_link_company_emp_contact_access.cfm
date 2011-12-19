
<!--Admin/qry_get_link_company_emp_contact_access.cfm
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
<cfquery name="get_Link_Company_Emp_Contact_access" datasource="#application.datasources.main#">
SELECT REF_Company.company_id, REF_Company.company, 
	CASE
		WHEN Link_Company_Emp_Contact.Link_Company_Emp_Contact_id IS NULL THEN '' 
		ELSE ' SELECTED'
	END AS has_company_access
FROM REF_Company
	LEFT OUTER JOIN Link_Company_Emp_Contact ON REF_Company.company_id=Link_Company_Emp_Contact.company_id
		AND Link_Company_Emp_Contact.emp_id=#attributes.emp_id#
ORDER BY REF_Company.company, REF_Company.company_id
</cfquery>
</cfsilent>

