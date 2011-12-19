
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
    ISNULL(REF_Billable.billable_type, 'Unknown') AS billable, ISNULL(COUNT(Task.task_id),0) AS open_tasks
FROM Project, Link_Project_Company, REF_Active_Indicator, REF_Billable, Task, Customer
WHERE Project.project_id=Link_Project_Company.project_id
	AND Project.active_ind=REF_Active_Indicator.active_ind
	AND Project.billable_type_id*=REF_Billable.billable_type_id
	AND Project.customer_id=Customer.customer_id
	AND Task.project_id=*Project.project_id
	AND Task.status_id!=11
	AND Customer.active_ind!=0
	AND Project.active_ind IN (<cfif compare(attributes.inactive, 0)>0,</cfif>1)
	AND Link_Project_Company.company_id IN (#session.workstream_selected_company_id#)
	AND Project.project_code like '#attributes.client_code#%'
	AND LEN(Project.project_code) > 4
	AND RIGHT(Project.project_code, 3)!='000'
GROUP BY Project.project_code, Project.description, REF_Active_Indicator.active_ind_type,
	Project.project_id, REF_Billable.billable_type, Customer.description
ORDER BY <cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)>Project.description, </cfif>Project.project_code
</cfquery>
</cfsilent>
