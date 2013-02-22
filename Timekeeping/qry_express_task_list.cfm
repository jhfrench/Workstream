
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
		AND Team.active_ind=1
		AND Team.role_id=1
		AND Team.user_account_id=#variables.user_identification#
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
		AND Link_Task_Task_Status.task_status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
WHERE Task.active_ind=1
UNION ALL
SELECT (Demographics.last_name || '-' || Task.name) AS task_name, Task.task_id, 2 AS sort_order
FROM Task
	INNER JOIN Team AS Owner ON Task.task_id=Owner.task_id
		AND Owner.active_ind=1
		AND Owner.role_id=1 
		AND Owner.user_account_id!=#variables.user_identification#
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=4
		AND Team.user_account_id=#variables.user_identification#
	INNER JOIN Demographics ON Owner.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
		AND Link_Task_Task_Status.task_status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
WHERE Task.active_ind=1
UNION ALL
/*generic codes like PTO*/
SELECT Task.name AS task_name, Task.task_id, 3 AS sort_order
FROM Task
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
		AND Link_Task_Task_Status.task_status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
WHERE Task.active_ind=1
	AND Task.task_id IN (713,714,719)<!--- $issue$: static tasks from original system, probably need to be replicated --->
ORDER BY sort_order, task_name
</cfquery>
</cfsilent>

