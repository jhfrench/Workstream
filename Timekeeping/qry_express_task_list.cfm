
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
SELECT Task.task_id, 
	CASE
		WHEN Team.role_id=1 THEN Task.name
		ELSE (Emp_Contact.lname || '-' || Task.name)
	END AS task_name, 
	CASE
		WHEN Team.role_id=1 THEN 1
		ELSE 2
	END AS sort_order
FROM Task
	INNER JOIN (
		SELECT task_id, MIN(role_id) AS role_id
		FROM Team
		WHERE emp_id=#variables.user_identification#
			AND role_id IN (1,4)
		GROUP BY task_id
	) Team ON Task.task_id=Team.task_id
	INNER JOIN Emp_Contact ON Team.emp_id=Emp_Contact.emp_id
WHERE Task.status_id NOT IN (7,9,10) /*completed, on hold, prospective*/<!--- $issue$: Task.active_ind=1? ---><cfif session.workstream_company_id EQ 1>
UNION ALL
/*generic codes like PTO*/
SELECT Task.task_id, Task.name AS task_name, 3 AS sort_order
FROM Task
WHERE Task.status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
	AND Task.task_id IN (713,714,719)<!--- $issue$: static tasks from original system, probably need to be replicated; create PTO, Military, Unpaid Leave tasks; create Task.permanent_task_ind ---></cfif>
ORDER BY sort_order, task_name
</cfquery>
</cfsilent>