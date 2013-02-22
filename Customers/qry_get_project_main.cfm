
<!--Customers/qry_get_project_main.cfm
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
<cfquery name="get_project_main" datasource="#application.datasources.main#">
SELECT Project.customer_id, Project.description, Project.budget,
    Project.product_id, Project.billable_type_id, Project.mission,
    Project.vision, Project.business_case, Project.project_start, 
	Project.project_end, Project.status, Project.project_manager_id,
	Project.active_ind, Project.file_path, Project.date_go_live,
	Project.LOE, Link_Project_Project_Status.project_status_id
FROM Project
	INNER JOIN Link_Project_Project_Status ON Project.project_id=Link_Project_Project_Status.project_id
		AND Link_Project_Project_Status.active_ind=1
WHERE Project.project_id=#attributes.project_id#
</cfquery>
</cfsilent>