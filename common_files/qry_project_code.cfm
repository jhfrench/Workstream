
<!--common_files/qry_project_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select all nonbillable project codes and all project codes (billable, non billable and flat rate for the company that the user selects in the company select list.

	||
	Edits:
	$Log$
	Revision 1.1  2005/06/21 14:57:00  french
	Splitting engagement list into customer and engagement lists. Task 33277

	Revision 1.0  2005-02-15 15:42:11-05  daugherty
	Initial revision

	Revision 1.4  2002-04-19 12:14:34-04  french
	Modified logic for the search page.

	Revision 1.3  2002-04-09 09:43:47-04  french
	Adding back the logic to trap for non-billable codes.

	Revision 1.2  2002-04-09 09:35:54-04  french
	Added comments, removed restriction on billing type.

	Revision 1.1  2001-10-11 10:57:36-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> attributes.used_by_search: boolean that indicates if this list is used just for the search page
	--> session.workstream_company_select_list: list of ids that correspond to companies the user wants to see
	--> session.workstream_project_list_order: number that indicates the user's preference for ordering mixed lists (ie: ORDER BY numeric code, or by text description)
	<-- project_code: number used in old model to identify a project, now serves as the billing code employees use for phone system, for example
	<-- description: text label for a customer/project combination
	<-- project_id: unique number used to identify a project
	END FUSEDOC --->
<cfif NOT isdefined("attributes.used_by_search")>
	<cfset attributes.used_by_search=0>
</cfif>
<cfquery name="project" datasource="#application.datasources.main#">
SELECT Project.project_code, Project.description, Project.project_id, 
	Customers.customers_id, Customers.description + ' (' + Customers.root_code + ')' AS customer,
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		(Project.project_code + ' - ' + Project.description)
	<cfelse>
		(Project.description + ' (' + Project.project_code + ')') 
	</cfif> AS project_label,
	CASE WHEN
	Customers.description != Project.description
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code + ' - ' + Customers.description + ' - ' + Project.description) 
		ELSE (Project.project_code + ' - ' + Project.description)
	<cfelse>
		THEN (Customers.description + ' - ' + Project.description + ' (' + Project.project_code + ')') 
		ELSE (Project.description + ' (' + Project.project_code + ')') 
	</cfif>END AS display
FROM Project, Customers, Project_Visible_To    
WHERE Project.customers_id=Customers.customers_id
	AND Project.project_id=Project_Visible_To.project_id<cfif attributes.used_by_search EQ 0>
	AND Project.billable_id IN (1,3,4)</cfif>
	AND Project_Visible_To.company_id IN (#session.workstream_company_select_list#)
GROUP BY Project.project_code, Project.description, Project.project_id, 
	Customers.customers_id, Customers.description, Customers.root_code,
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		(Project.project_code + ' - ' + Project.description)
	<cfelse>
		(Project.description + ' (' + Project.project_code + ')') 
	</cfif>,
	CASE WHEN
	Customers.description != Project.description
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code + ' - ' + Customers.description + ' - ' + Project.description) 
		ELSE (Project.project_code + ' - ' + Project.description)
	<cfelse>
		THEN (Customers.description + ' - ' + Project.description + ' (' + Project.project_code + ')') 
		ELSE (Project.description + ' (' + Project.project_code + ')') 
	</cfif>END
ORDER BY display
</cfquery>
</cfsilent>

