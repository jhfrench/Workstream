
<!--Reports/qry_account_status_report.cfm
	Author: Jeromy F  -->
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
SELECT Task.task_id, (Customer.description + '-' + Project.description) AS project_name,
	Task.name AS task_name, REF_Status.status, REF_Priority.description AS priority,
	Task.assigned_date, Task.due_date, Task.complete_date, Emp_contact.lname AS owner
FROM Task, REF_Status, Project, Customer, Team, Emp_Contact, REF_Priority
WHERE Task.status_id=REF_Status.status_id
	AND Task.project_id=Project.project_id
	AND Task.task_id=Team.task_id
	AND Team.emp_id=Emp_Contact.emp_id
	AND Task.priority_id=REF_Priority.priority_id
	AND Team.role_id=1
	AND Project.customer_id=Customer.customer_id
	AND (Task.status_id!=11
		OR Task.complete_date BETWEEN DATEADD(wk,-1,GETDATE()) AND GETDATE()
	)
ORDER BY Customer.description + '-' + Project.description, Task.due_date, Task.assigned_date
</cfquery>
</cfsilent>

