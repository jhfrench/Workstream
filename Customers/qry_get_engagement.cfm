
<!--Customers/qry_get_engagement.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am used with the edit engagement screen, I select the particular engagement that the user wants to edit.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_engagement" datasource="#application.datasources.main#">
SELECT Project.description, Project.project_code, Project.budget, 
	REF_Billable_Type.description AS billable_type, Project.billable_type_id, Project.active_ind,
	REF_Active_Indicator.active_ind_Type, project.company_id,
	Flat_Rate.rate_end_date, Flat_Rate.rate_start_date
FROM Project
	INNER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
	INNER JOIN REF_Active_Indicator ON Project.active_ind = REF_Active_Indicator.active_ind
	LEFT OUTER JOIN Flat_Rate ON Project.project_id = Flat_Rate.project_id
		AND Flat_Rate.active_ind=1
WHERE project.project_id = #attributes.project_id#
</cfquery>
</cfsilent>
