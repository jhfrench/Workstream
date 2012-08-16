
<!--Customers/qry_get_engagement_main.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_engagement_main" datasource="#application.datasources.main#">
SELECT Project.customer_id, Project.description, Project.budget,
    Project.product_id, Project.billable_type_id, Project.mission,
    Project.vision, Project.business_case, Project.project_start, 
	Project.project_end, Project.status, Project.project_manager_emp_id,
	Project.active_ind, Project.file_path, Project.date_go_live,
	Project.eng_status, Project.LOE
FROM Project
WHERE Project.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

