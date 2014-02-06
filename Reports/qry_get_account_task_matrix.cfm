
<!--Reports/qry_get_account_task_matrix.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="get_account_task_matrix" datasource="#application.datasources.main#">
SELECT Task.task_id, (Customer.description || '-' || Project.description) AS project_name, Task.name AS task_name,
	REF_Task_Status.description AS task_status, REF_Priority.description AS priority, Task.assigned_date,
	Task.due_date, Task.complete_date, Demographics.first_name AS owner
FROM Task
	INNER JOIN Project ON Task.project_id=Project.project_id
		AND Project.active_ind=1<cfif isdefined("attributes.project_id")>
		AND Project.project_id=#attributes.project_id#</cfif>
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
		AND Customer.active_ind=1<cfif isdefined("attributes.customer_id")>
		AND Customer.customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer" /></cfif>
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1 /*owner*/
	INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
	INNER JOIN REF_Task_Status ON Link_Task_Task_Status.task_status_id=REF_Task_Status.task_status_id
WHERE Task.active_ind=1
	AND (Link_Task_Task_Status.task_status_id!=7 /*exclude closed tasks*/
		OR Task.complete_date BETWEEN CURRENT_DATE-interval '1 week' AND CURRENT_TIMESTAMP)
ORDER BY Customer.description || '-' || Project.description, Task.due_date, Task.assigned_date
</cfquery>
</cfsilent>