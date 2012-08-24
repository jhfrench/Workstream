
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
	<cfset variables.valid_codes=session.workstream_selected_company_id>
</cfif>
<cfquery name="get_valid_projects" datasource="#application.datasources.main#">
SELECT Customer.customer_id, Customer.description || ' (' ||  Customer.root_code || ')' AS customer,
	Project.description AS project_name, Project.project_id, Project.project_code, 
	CASE WHEN Customer.description!=Project.description
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
		THEN (Project.project_code || '-' || Customer.description || '-' || Project.description) 
		ELSE (Project.project_code || '-' || Project.description)
	<cfelse>
		THEN (Customer.description || '-' || Project.description || ' (' ||  Project.project_code || ')') 
		ELSE (Project.description || ' (' ||  Project.project_code || ')') 
	</cfif>END AS display
FROM Customer
	INNER JOIN Project ON Customer.customer_id=Project.customer_id
		AND Project.active_ind=1
		AND COALESCE(Project.project_end, CURRENT_TIMESTAMP) > CURRENT_DATE
		AND (
			(Project.company_id=#session.workstream_company_id# AND Project.billable_type_id=2)
			OR Project.billable_type_id!=2
		)
		AND Project.project_type_id!=3
	INNER JOIN (
		SELECT project_id
		FROM Link_Project_Company
		WHERE company_id IN (#variables.valid_codes#)
		GROUP BY project_id
	) AS Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
	INNER JOIN (
		SELECT customer_id
		FROM Link_Customer_Company
		WHERE company_id IN (#variables.valid_codes#)
		GROUP BY customer_id
	) AS Link_Customer_Company ON Customer.customer_id=Link_Customer_Company.customer_id
ORDER BY Customer.sort_order, display
</cfquery>
</cfsilent>