
<!--Customers/qry_get_projects.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am used with the display projects page, I select all the projects for a root code.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_projects" datasource="#application.datasources.main#">
SELECT Project.project_code, Project.description, Customer.description AS customer_description,
    Project.project_id, REF_Active_Indicator.active_ind_type, COALESCE(REF_Billable_Type.description, 'Unknown') AS billable,
	COALESCE(Task_Count.open_tasks,0) AS open_tasks
FROM Project
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN REF_Active_Indicator ON Project.active_ind=REF_Active_Indicator.active_ind
	LEFT OUTER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
	LEFT OUTER JOIN (
		SELECT project_id, COUNT(*) AS open_tasks
		FROM Task
		WHERE Task.status_id!=7 /*exclude closed tasks*/
		GROUP BY Task.project_id
	) AS Task_Count ON Project.project_id=Task_Count.project_id
WHERE Project.active_ind=#attributes.active_ind#<cfif isdefined("attributes.customer_id")>
	AND Project.customer_id=#attributes.customer_id#</cfif>
	AND Project.project_id IN (
		SELECT project_id
		FROM Link_Project_Company
		WHERE Link_Project_Company.company_id IN (#session.workstream_selected_company_id#)
	)
ORDER BY <cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)>Project.description, </cfif>Project.project_code
</cfquery>
</cfsilent>
