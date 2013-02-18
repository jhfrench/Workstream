
<!--common_files/qry_get_link_project_company.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I return the companies that are associated with a specified project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>

<cfquery name="get_link_project_company" datasource="#application.datasources.main#">
SELECT company_id
FROM Link_Project_Company
WHERE active_ind=1
	AND project_id=#attributes.project_id#
</cfquery>
<cfset caller.attributes.get_link_project_company=get_link_project_company>