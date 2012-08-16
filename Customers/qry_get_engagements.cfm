
<!--Customers/qry_get_engagements.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am used with the display engagements page, I select all the engagements for a root code.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_engagements" datasource="#application.datasources.main#">
SELECT Project.project_code, Project.description, Customer.description AS Cust_Description,
    Project.project_id, REF_Active_Indicator.active_ind_type, 
    COALESCE(REF_Billable_Type.description, 'Unknown') AS billable, COALESCE(COUNT(Task.task_id),0) AS open_tasks
FROM Project
	INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
	INNER JOIN REF_Active_Indicator ON Project.active_ind=REF_Active_Indicator.active_ind
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
	LEFT OUTER JOIN Task ON Project.project_id=Task.project_id
		AND Task.status_id!=11
WHERE Customer.active_ind=1
	AND Project.active_ind=#attributes.active_ind#
	AND Link_Project_Company.company_id IN (#session.workstream_selected_company_id#)<cfif isdefined("attributes.client_code")>
	AND Project.project_code like '#attributes.client_code#%'</cfif>
GROUP BY Project.project_code, Project.description, REF_Active_Indicator.active_ind_type,
	Project.project_id, REF_Billable_Type.description, Customer.description
ORDER BY <cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)>Project.description, </cfif>Project.project_code
</cfquery>
</cfsilent>
