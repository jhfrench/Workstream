
<!--Reports/qry_account_status_report.cfm
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
<cfquery name="account_status_report" datasource="#application.datasources.main#">
SELECT Task.task_id, (Customer.description || '-' || Project.description) AS project_name, Task.name AS task_name,
	REF_Status.status, REF_Priority.description AS priority, Task.assigned_date,
	Task.due_date, Task.complete_date, Emp_contact.lname AS owner
FROM Task
	INNER JOIN REF_Status ON Task.status_id=REF_Status.status_id
	INNER JOIN Project ON Task.project_id=Project.project_id<cfif isdefined("attributes.project_id")>
		AND Project.project_id=#attributes.project_id#</cfif>
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id<cfif isdefined("attributes.customer_id")>
		AND Customer.customer_id=#attributes.customer_id#</cfif>
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1
	INNER JOIN Emp_Contact ON Team.user_account_id=Emp_Contact.emp_id
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
WHERE Task.status_id!=7 /*exclude closed tasks*/
		OR Task.complete_date BETWEEN CURRENT_DATE-interval '1 week' AND CURRENT_TIMESTAMP
ORDER BY Customer.description || '-' || Project.description, Task.due_date, Task.assigned_date
</cfquery>
</cfsilent>