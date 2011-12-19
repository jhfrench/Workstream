
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
	Revision 1.0  2005/02/15 21:02:13  daugherty
	Initial revision

	Revision 1.0  2001-11-28 13:49:13-05  french
	Initial file creation.

	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="get_valid_projects" datasource="#application.datasources.main#">
SELECT LTRIM(Customers.description) AS customer,
    Project.description AS project_name,
    Project.project_id AS project_id,
    Project.project_code AS project_code
FROM Customers, Project, Project_Visible_To, Customer_Visible_To
WHERE Customers.customers_id = Project.customers_id
	AND Project.project_id = Project_Visible_To.project_id
	AND Customers.customers_id = Project.customers_id
	AND Customer_Visible_To.visible_to IN (<cfif session.workstream_emp_contact_type EQ 2>#session.workstream_company_id#<cfelse>#session.workstream_company_select_list#</cfif>)
	AND Project_Visible_To.company_id IN (<cfif session.workstream_emp_contact_type EQ 2>#session.workstream_company_id#<cfelse>#session.workstream_company_select_list#</cfif>) 
	AND (Project.active_id = 2  AND (Project.project_end IS NULL OR GETDATE() < Project.project_end))
	<cfif session.workstream_emp_contact_type NEQ 2>AND ((1 = CASE WHEN (Project.company_id = #session.workstream_company_id# AND Project.billable_id IN (2)) OR Project.billable_id NOT IN (2) THEN 1 ELSE 0 END) OR Project.company_id = 0)
	AND Project.project_type_id != 3
	AND Project.project_id IN 
		(SELECT project_id
		FROM user_fields, user_field_project_link
		WHERE user_fields.user_field_id=user_field_project_link.user_field_id
			AND user_fields.active_ind=1
		GROUP BY project_id)
GROUP BY LTRIM(Customers.description),
	Project.description,
	Project.project_id,
	Project.project_code,
	Project.billable_id,
	Project.company_id</cfif>
	ORDER BY <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Project.project_code,LTRIM(Customers.description), Project.description<cfelse>LTRIM(Customers.description), Project.description, Project.project_code</cfif>
</cfquery>
</cfsilent>

