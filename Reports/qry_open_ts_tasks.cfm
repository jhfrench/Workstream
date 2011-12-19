
<!--Reports/qry_open_ts_tasks.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves information about currently open tech support tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:14:26  stetzer
	<>

	Revision 1.0  2002-01-07 10:37:40-05  french
	Creating tech support report.

	||
	END FUSEDOC --->
<cfquery name="open_ts_tasks" datasource="#application.datasources.main#">
SELECT Emp_contact.lname, Task.task_id, Task.name, Task.due_date, 
	ISNULL(Task.budgeted_hours,0) AS budgeted_hours, REF_Status.status, 
	REF_Priority.description AS priority
FROM Task, Team, Emp_Contact, REF_Status, REF_Priority
WHERE Task.task_id=Team.task_id
	AND Task.status_id=REF_Status.status_id
	AND Task.priority_id=REF_Priority.priority_id
	AND Team.roll_id=1
	AND Team.emp_id=Emp_Contact.emp_id
	AND Task.name LIKE 'TS%'
	AND Task.status_id Not in (11,7)
ORDER BY Emp_contact.lname
</cfquery>
</cfsilent>

