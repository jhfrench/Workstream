
<!--Customers/qry_get_project_visable_to.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the companies that a project  is visible to

	||
	Edits:
	$Log$
	||
	-->#code#:this is the variable that is passed into the query so that there can be a join on the company_id table
	END FUSEDOC --->
<cfquery name="get_visable_to" datasource="#application.datasources.main#">
SELECT project_Visible_To.project_id, REF_Company.description AS company, 
    project_Visible_To.company_id
FROM project_Visible_To
	INNER JOIN REF_Company ON project_Visible_To.company_id = REF_Company.company_id
WHERE project_id = '#project_id#'
</cfquery>
<cfset selected = valuelist(get_visable_to.company_id)>
<cfquery name="get_other_companies" datasource="#application.datasources.main#">
SELECT description AS company
FROM REF_Company
WHERE company_id NOT IN (#Quotedvaluelist(get_visable_to.company_id)#)
</cfquery>