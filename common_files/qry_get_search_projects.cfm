
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

<cfif session.workstream_emp_contact_type EQ 2>
	<cfset variables.valid_codes=session.workstream_company_id>
<cfelse>
	<cfset variables.valid_codes=session.workstream_company_select_list>
</cfif>
<cfquery name="get_search_projects" datasource="#application.datasources.main#">
SELECT Customers.customers_id, Customers.description + ' (' + Customers.root_code + ')' AS customer,
	Project.description AS project_name,
	Project.project_id AS project_id,
	Project.project_code AS project_code, 
	CASE WHEN
	Customers.description != Project.description
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code + ' - ' + Customers.description + ' - ' + Project.description) 
		ELSE (Project.project_code + ' - ' + Project.description)
	<cfelse>
		THEN (Customers.description + ' - ' + Project.description + ' (' + Project.project_code + ')') 
		ELSE (Project.description + ' (' + Project.project_code + ')') 
	</cfif>END AS display
FROM Customers, Project, Project_Visible_To, Customer_Visible_To
WHERE Customers.customers_id = Project.customers_id
	AND Project.project_id = Project_Visible_To.project_id
	AND Customers.root_code = Customer_Visible_To.code
	AND Customer_Visible_To.visible_to IN (#variables.valid_codes#)
	AND Project_Visible_To.company_id IN (#variables.valid_codes#)
	AND Project.project_type_id!=3 
GROUP BY Customers.customers_id, Customers.description, Customers.root_code,
	Project.description,
	Project.project_id,
	Project.project_code,
	Project.billable_id,
	Project.company_id, 
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

