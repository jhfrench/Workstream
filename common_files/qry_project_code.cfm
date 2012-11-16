
<!--common_files/qry_project_code.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select all nonbillable project codes and all project codes (billable, non billable and flat rate for the company that the user selects in the company select list.

	||
	Edits:
	$Log$
	 || 
	--> attributes.used_by_search_ind: boolean that indicates if this list is used just for the search page
	--> session.workstream_selected_company_id: list of ids that correspond to companies the user wants to see
	--> session.workstream_project_list_order: number that indicates the user's preference for ordering mixed lists (ie: ORDER BY numeric code, or by text description)
	<-- project_code: number used in old model to identify a project, now serves as the billing code employees use for phone system, for example
	<-- description: text label for a customer/project combination
	<-- project_id: unique number used to identify a project
	END FUSEDOC --->
<cfif NOT isdefined("attributes.used_by_search_ind")>
	<cfset attributes.used_by_search_ind=0>
</cfif>
<cfquery name="project" datasource="#application.datasources.main#">
SELECT Project.project_code, Project.description, Project.project_id, 
	Customer.customer_id, Customer.description || ' (' ||  Customer.root_code || ')' AS customer,
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		(Project.project_code || '-' || Project.description)
	<cfelse>
		(Project.description || ' (' ||  Project.project_code || ')') 
	</cfif> AS project_label,
	CASE WHEN
	Customer.description!=Project.description
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code || '-' || Customer.description || '-' || Project.description) 
		ELSE (Project.project_code || '-' || Project.description)
	<cfelse>
		THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')') 
		ELSE (Project.description || ' (' ||  Project.project_code || ')') 
	</cfif>END AS display
FROM Project, Customer, Link_Project_Company
WHERE Project.customer_id=Customer.customer_id
	AND Project.project_id=Link_Project_Company.project_id<cfif attributes.used_by_search_ind EQ 0>
	AND Project.billable_type_id IN (1,3,4)</cfif>
	AND Link_Project_Company.company_id IN (#session.workstream_selected_company_id#)
GROUP BY Project.project_code, Project.description, Project.project_id, 
	Customer.customer_id, Customer.description, Customer.root_code,
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		(Project.project_code || '-' || Project.description)
	<cfelse>
		(Project.description || ' (' ||  Project.project_code || ')') 
	</cfif>,
	CASE WHEN
	Customer.description!=Project.description
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code || '-' || Customer.description || '-' || Project.description) 
		ELSE (Project.project_code || '-' || Project.description)
	<cfelse>
		THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')') 
		ELSE (Project.description || ' (' ||  Project.project_code || ')') 
	</cfif>END
ORDER BY display
</cfquery>
</cfsilent>

