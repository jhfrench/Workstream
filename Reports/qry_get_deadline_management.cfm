
<!--Reports/qry_get_deadline_management.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the deadline management report breakdown of individual member performance.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> get_subordinates.user_account_id: query results from common_files/qry_get_subordinates.cfm
	<-- user_account_id: number that uniquely identifies an employee
	<-- last_name: string containing the last name of an employee
	<-- name: string containing the first name of an employee
	<-- on_time: decimal number that indicates the percent of tasks an employee has completed on time or early in the specified month
	END FUSEDOC --->
<cfquery name="get_deadline_management" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name, Demographics.first_name,
	Task.due_date, EXTRACT(YEAR FROM Task.due_date) AS due_year, EXTRACT(MONTH FROM Task.due_date) AS due_month,
	(CASE WHEN Task.complete_date < (Task.due_date+INTERVAL '1 day') THEN 1.00 ELSE 0.00 END) AS on_time
FROM Task
	INNER JOIN Team ON Team.task_id=Task.task_id
		AND Team.active_ind=1
		AND Team.role_id=1 /*owner*/
		AND Team.user_account_id IN (#valuelist(get_subordinates.user_account_id)#)
	/*if a task has had multile owners it's not fair to judge the current owner for on-time performance of that task*/
	INNER JOIN (
		SELECT task_id, COUNT(*) AS owner_count
		FROM Team
		WHERE Team.role_id=1 /*owner*/
		GROUP BY task_id, user_account_id
	) AS Team_History ON Task.task_id=Team_History.task_id
		AND Team_History.owner_count=1
	INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
WHERE Task.complete_date IS NOT NULL
	AND Task.due_date <= CURRENT_TIMESTAMP
</cfquery>

<cfquery name="deadline_management_main" dbtype="query">
SELECT due_year, due_month, AVG(on_time)*100.00 AS on_time_percent
FROM get_deadline_management
GROUP BY due_year, due_month
ORDER BY due_year DESC, due_month DESC
</cfquery>

<cfquery name="deadline_management_sub" dbtype="query">
SELECT user_account_id, last_name, first_name, SUM(on_time) AS on_time_count, COUNT(*) AS task_count, (AVG(on_time)*100) AS on_time_average
FROM get_deadline_management
WHERE due_year=#attributes.admin_year#
	AND due_month=#attributes.admin_month#
GROUP BY last_name, name, user_account_id
ORDER BY last_name, name, user_account_id
</cfquery>
</cfsilent>