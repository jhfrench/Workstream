
<!--Reports/qry_get_project_dashboard.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am not properly docummented by the file's author.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>

<cfquery name="get_project_dashboard" datasource="#application.datasources.main#">
SELECT Project.project_id, Project.project_code, Project.description,
	Project.company_id, Project.project_manager_id, Project.created_date,
	COALESCE(Project.date_go_live, Project.project_end) AS deadline_date, REF_Project_Health.description AS project_health,
	REF_Project_Health.badge, REF_Project_Health.icon, REF_Project_Status.description AS project_status,
	Project.billable_type_id, Project.loe, Project.budget,
	Project.mission, Project.vision, Project.date_updated,
	Project.file_path, Project.active_ind, Customer.description AS customer_description,
	Billing_History.total_bill_amount, REF_Billable_Type.description AS billable_type,
	Customer.customer_id, Demographics.last_name, Demographics.first_name,
	COALESCE(Task_Count.task_count,0) AS task_count
FROM Project
	INNER JOIN REF_Billable_Type ON Project.billable_type_id=REF_Billable_Type.billable_type_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN Demographics ON Project.project_manager_id=Demographics.user_account_id
		AND Demographics.active_ind=1
    LEFT OUTER JOIN (
		SELECT project_id,SUM(total_bill_amount) AS total_bill_amount
		FROM Billing_History
		WHERE active_ind=1
		GROUP BY project_id
	) AS Billing_History ON Project.project_id=Billing_History.project_id
	INNER JOIN Link_Project_Project_Status ON Project.project_id=Link_Project_Project_Status.project_id
		AND Link_Project_Project_Status.active_ind=1<cfif attributes.project_status_id NEQ 0>
		AND Link_Project_Project_Status.project_status_id IN (<cfqueryparam value="#attributes.project_status_id#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
	INNER JOIN REF_Project_Status ON Link_Project_Project_Status.project_status_id=REF_Project_Status.project_status_id
	INNER JOIN Link_Project_Project_Health ON Project.project_id=Link_Project_Project_Health.project_id
		AND Link_Project_Project_Health.active_ind=1
	INNER JOIN REF_Project_Health ON Link_Project_Project_Health.project_health_id=REF_Project_Health.project_health_id
	LEFT OUTER JOIN (
		SELECT Task.project_id, COUNT(Task.task_id) AS task_count
		FROM Task
			INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
				AND Link_Task_Task_Status.active_ind=1
				AND Link_Task_Task_Status.task_status_id NOT IN (7,9) /*completed, on hold*/
		WHERE Task.active_ind=1
		GROUP BY Task.project_id
	) AS Task_Count ON Project.project_id=Task_Count.project_id
WHERE Project.active_ind=1
    AND Project.company_id=<cfqueryparam value="#session.workstream_company_id#" cfsqltype="cf_sql_integer" /><cfif attributes.project_manager_id NEQ 0>
	AND Project.project_manager_id=<cfqueryparam value="#attributes.project_manager_id#" cfsqltype="cf_sql_integer" /></cfif><cfif attributes.customer_id NEQ 0>
	AND Project.customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer" /></cfif>
ORDER BY Customer.description, Project.description, REF_Project_Status.sort_order
</cfquery>