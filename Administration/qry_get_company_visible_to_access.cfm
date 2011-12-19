
<!--Admin/qry_get_company_visible_to_access.cfm
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
	Revision 1.0  2006/07/05 17:27:02  french
	Initial revision.

	||
 --->
<cfquery name="get_company_visible_to_access" datasource="#application.datasources.main#">
SELECT REF_Companies.company_id, REF_Companies.company, 
	CASE
		WHEN Company_Visible_To.Company_Visible_To_id IS NULL THEN '' 
		ELSE ' SELECTED'
	END AS has_company_access
FROM REF_Companies
	LEFT OUTER JOIN Company_Visible_To ON REF_Companies.company_id=Company_Visible_To.company_id
		AND Company_Visible_To.emp_id=#attributes.emp_id#
ORDER BY REF_Companies.company, REF_Companies.company_id
</cfquery>
</cfsilent>

