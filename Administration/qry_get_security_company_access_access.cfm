
<!--Admin/qry_get_security_company_access_access.cfm
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
<cfquery name="get_security_company_access_access" datasource="#application.datasources.main#">
SELECT REF_Company.company_id, REF_Company.description AS company, 
	CASE
		WHEN Security_Company_Access.security_company_access_id IS NULL THEN '' 
		ELSE ' SELECTED'
	END AS has_company_access
FROM REF_Company
	LEFT OUTER JOIN Security_Company_Access ON REF_Company.company_id=Security_Company_Access.company_id
		AND Security_Company_Access.emp_id=#attributes.emp_id#
ORDER BY REF_Company.description, REF_Company.company_id
</cfquery>
</cfsilent>

