
<!--Reports/qry_account_status_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:37  stetzer
	<>

	||
	END FUSEDOC --->
<cfquery name="account_status_report" datasource="#application.datasources.main#">
SELECT Task.task_id, (Customers.description + '-' + Project.description) AS project_name,
	Task.name AS task_name, REF_Status.status, REF_Priority.description AS priority,
	Task.assigned_date, Task.due_date, Task.complete_date, Emp_contact.lname AS owner
FROM Task, REF_Status, Project, Customers, Team, Emp_Contact, REF_Priority
WHERE Task.status_id=REF_Status.status_id
	AND Task.project_id=Project.project_id
	AND Task.task_id=Team.task_id
	AND Team.emp_id=Emp_Contact.emp_id
	AND Task.priority_id=REF_Priority.priority_id
	AND Team.roll_id=1
	AND Project.customers_id=Customers.customers_id
	AND Project.root_code=6540
	AND (Task.status_id!=11
		OR Task.complete_date BETWEEN DATEADD(wk,-1,GETDATE()) AND GETDATE()
	)
ORDER BY Customers.description + '-' + Project.description, Task.due_date, Task.assigned_date
</cfquery>
</cfsilent>

