
<!--Reports/qry_open_ts_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves information about currently open tech support tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="open_ts_tasks" datasource="#application.datasources.main#">
SELECT Emp_contact.lname, Task.task_id, Task.name,
	Task.due_date,  COALESCE(Task.budgeted_hours,0) AS budgeted_hours, REF_Status.status, 
	REF_Priority.description AS priority
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1
	INNER JOIN Emp_Contact ON Team.user_account_id=Emp_Contact.user_account_id
	INNER JOIN REF_Status ON Task.status_id=REF_Status.status_id
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
WHERE LOWER(Task.name) LIKE 'ts%'
	AND Task.status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
ORDER BY Emp_contact.lname
</cfquery>
</cfsilent>