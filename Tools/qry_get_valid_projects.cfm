
<!--Tools/qry_get_valid_projects.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all projects that a user can see. The project must be active and visible to the company for which the user works and must have custom fields.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="get_valid_projects" datasource="#application.datasources.main#">
SELECT LTRIM(Customer.description) AS customer, Project.description AS project_name, Project.project_id,
    Project.project_code AS project_code
FROM Customer, Project, Link_Project_Company, Link_Customer_Company
WHERE Customer.customer_id = Project.customer_id
	AND Project.project_id = Link_Project_Company.project_id
	AND Customer.customer_id = Project.customer_id
	AND Link_Customer_Company.company_id IN (<cfif session.workstream_emp_contact_type EQ 2>#session.workstream_company_id#<cfelse>#session.workstream_selected_company_id#</cfif>)
	AND Link_Project_Company.company_id IN (<cfif session.workstream_emp_contact_type EQ 2>#session.workstream_company_id#<cfelse>#session.workstream_selected_company_id#</cfif>) 
	AND (Project.active_ind = 1
	AND (Project.project_end IS NULL OR CURRENT_TIMESTAMP < Project.project_end))<cfif session.workstream_emp_contact_type NEQ 2>
	AND (
		(1 = CASE 
			WHEN (Project.company_id = #session.workstream_company_id# AND Project.billable_type_id=2) OR Project.billable_type_id NOT IN (2) THEN 1 
			ELSE 0 
		END)
		OR Project.company_id = 0
	)
	AND Project.project_type_id != 3
	AND Project.project_id IN 
		(SELECT project_id
		FROM user_fields, user_field_project_link
		WHERE user_fields.user_field_id=user_field_project_link.user_field_id
			AND user_fields.active_ind=1
		GROUP BY project_id)
GROUP BY LTRIM(Customer.description), Project.description, Project.project_id,
	Project.project_code, Project.billable_type_id, Project.company_id</cfif>
ORDER BY <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Project.project_code, LTRIM(Customer.description), Project.description<cfelse>LTRIM(Customer.description), Project.description, Project.project_code</cfif>
</cfquery>
</cfsilent>

