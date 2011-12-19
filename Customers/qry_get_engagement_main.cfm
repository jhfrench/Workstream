
<!--Customers/qry_get_engagement_main.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/08/26 13:53:33  stetzer
	Added LOE field

	Revision 1.0  2005-02-15 15:46:09-05  daugherty
	Initial revision

	Revision 1.4  2002-01-30 13:37:09-05  french
	Respacing the query text.

	Revision 1.3  2002-01-28 16:38:55-05  french
	Added Project.date_go_live.
	||
	END FUSEDOC --->
<cfquery name="get_engagement_main" datasource="#application.datasources.main#">
SELECT Project.customers_id, Project.description, Project.budget,
    Project.product_id, Project.billable_id, Project.mission,
    Project.vision, Project.business_case, Project.project_start, 
	Project.project_end, Project.status, Project.ie_emp_id,
	Project.active_id, Project.file_path, Project.date_go_live, Project.eng_status, Project.LOE
FROM Project
WHERE Project.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

