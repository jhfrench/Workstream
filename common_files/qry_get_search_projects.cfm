
<!--common_files/qry_get_valid_projects.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all projects that a user can see. The project must be active and visible to the company for which the user works.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->

<cfif session.account_type_id EQ 2>
	<cfset variables.valid_codes=session.workstream_company_id>
<cfelse>
	<cfset variables.valid_codes=session.workstream_selected_company_id>
</cfif>
<cfquery name="get_search_projects" datasource="#application.datasources.main#">
SELECT Customer.customer_id, Customer.description || ' (' ||  Customer.root_code || ')' AS customer,
	Project.description AS project_name,
	Project.project_id,
	Project.project_code, 
	CASE
		WHEN Customer.description!=Project.description
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code || '-' || Customer.description || '-' || Project.description) 
		ELSE (Project.project_code || '-' || Project.description)
	<cfelse>
		THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')') 
		ELSE (Project.description || ' (' ||  Project.project_code || ')') 
	</cfif>END AS display
FROM Customer, Project, Link_Project_Company, Link_Customer_Company
WHERE Customer.customer_id = Project.customer_id
	AND Project.project_id = Link_Project_Company.project_id
	AND Customer.customer_id=Link_Customer_Company.customer_id
	AND Link_Customer_Company.company_id IN (#variables.valid_codes#)
	AND Link_Project_Company.company_id IN (#variables.valid_codes#)
	AND Project.project_id!=#application.application_specific_settings.pto_project_id#
GROUP BY Customer.customer_id, Customer.description, Customer.root_code,
	Project.description, Project.project_id, Project.project_code,
	Project.billable_type_id, Project.company_id, 
	CASE
		WHEN Customer.description!=Project.description
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

