
<!--Customers/qry_get_project_visable_to.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the companies that a project  is visible to

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:12  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:17-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	-->#code#:this is the variable that is passed into the query so that there can be a join on the company_id table
	END FUSEDOC --->
<cfquery name="get_visable_to" datasource="#application.datasources.main#">
SELECT project_Visible_To.project_id, REF_companies.Company, 
    project_Visible_To.company_id
FROM project_Visible_To
	INNER JOIN REF_companies ON project_Visible_To.company_id = REF_companies.Company_ID
WHERE project_id = '#project_id#'
</cfquery>
<cfset selected = valuelist(get_visable_to.company_id)>
<cfquery name="get_other_companies" datasource="#application.datasources.main#">
SELECT company
FROM REF_Companies
WHERE company NOT IN (#Quotedvaluelist(get_visable_to.company_id)#)
</cfquery>