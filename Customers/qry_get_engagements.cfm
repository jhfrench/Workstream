
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
SELECT Project.project_code, Project.description, Customers.description AS Cust_Description,
    Project.project_id, REF_Active_Indicator.active_ind_type, 
    ISNULL(REF_Billable.billable_type, 'Unknown') AS billable, ISNULL(COUNT(Task.task_id),0) AS open_tasks
FROM Project, Project_Visible_To, REF_Active_Indicator, REF_Billable, Task, Customers
WHERE Project.project_id=Project_Visible_To.project_id
	AND Project.active_ind=REF_Active_Indicator.active_ind
	AND Project.billable_id*=REF_Billable.billable_id
	AND Project.Root_Code = Customers.Root_Code
	AND Task.project_id=*Project.project_id
	AND Task.status_id!=11
	ANd Customers.active_id!=0
	AND Project.active_id IN (<cfif compare(attributes.inactive, 0)>1,</cfif>2)
	AND Project_Visible_To.company_id IN (#session.workstream_company_select_list#)

	AND Project.project_code like '#attributes.client_code#%'
	

<!--- <cfif NOT Project_ID contains 'no'>
    AND Project.Project_ID like '#project_id#'
</cfif>	 --->
	AND LEN(Project.project_code) > 4
	AND RIGHT(Project.project_code, 3)!='000'
GROUP BY Project.project_code, Project.Description, 
    REF_Active_Indicator.Active_Ind_Type, Project.project_id, 
    REF_Billable.Billable_Type,Customers.description
ORDER BY <cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)>Project.description, </cfif>Project.project_code
</cfquery>
</cfsilent>
