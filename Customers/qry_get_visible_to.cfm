
<!--Customers/qry_get_company_id.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_company_id" datasource="#application.datasources.main#">
SELECT company_id
FROM Link_Project_Company
WHERE project_id=#attributes.project_id#
</cfquery>
</cfsilent>

