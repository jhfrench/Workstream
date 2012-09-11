
<!--Timekeeping/qry_express_task_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the list of tasks that a user may need to enter time for from the express entry page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfquery name="get_express_task_list" datasource="#application.datasources.main#">
SELECT Task.name AS task_name, Task.task_id, 1 AS sort_order
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.role_id=1
		AND team.emp_id=#variables.user_identification#
WHERE Task.status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
UNION ALL
SELECT (Emp_Contact.lname || '-' || Task.name) AS task_name, Task.task_id, 2 AS sort_order
FROM Task
	INNER JOIN Team Owner ON Task.task_id=Owner.task_id
		AND Owner.role_id=1 
		AND Owner.emp_id!=#variables.user_identification#
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.role_id=4
		AND Team.emp_id=#variables.user_identification#
	INNER JOIN Emp_Contact ON Owner.emp_id=Emp_Contact.emp_id
WHERE Task.status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
UNION ALL
/*generic codes like PTO*/
SELECT Task.name AS task_name, Task.task_id, 3 AS sort_order
FROM Task
WHERE Task.status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
	AND Task.task_id IN (713,714,719)<!--- $issue$: static tasks from original system, probably need to be replicated --->
ORDER BY sort_order, task_name
</cfquery>
</cfsilent>

