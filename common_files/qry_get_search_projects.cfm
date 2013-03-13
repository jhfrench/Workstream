
<!--common_files/qry_get_search_projects.cfm
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
	Project.project_id, Project.project_code, Project.description AS project_name,
	CASE
		WHEN Customer.description!=Project.description
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code || '-' || Customer.description || '-' || Project.description) 
		ELSE (Project.project_code || '-' || Project.description)
	<cfelse>
		THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')') 
		ELSE (Project.description || ' (' ||  Project.project_code || ')') 
	</cfif>END AS display
FROM Customer
	INNER JOIN Project ON Customer.customer_id=Project.customer_id
		AND Project.project_id!=<cfqueryparam cfsqltype="cf_sql_integer" value="#application.application_specific_settings.pto_project_id#">
		AND Project.active_ind=1
	INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
		AND Link_Project_Company.company_id IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.valid_codes#" list="true">)
		AND Link_Project_Company.active_ind=1
WHERE Customer.active_ind=1
GROUP BY Customer.customer_id, Customer.description, Customer.root_code,
	Project.project_id, Project.project_code, Project.description,
	display
ORDER BY display
</cfquery>
</cfsilent>