
/*<!--Reports/sql_employee_force.cfm
	Author: Jeromy F -->*/
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
</cfsilent>
<cfoutput>
SELECT Task.task_id, (Customer.description || '-' || Project.description) AS project, Task.name AS task,
	(CASE WHEN Project.billable_type_id = 2 THEN 'NB' ELSE 'B' END) AS billable, REF_Priority.description AS priority,
	REF_Task_Status.description AS status, Task.due_date, Task.complete_date,
	COALESCE(Recorded_Hours.used_hours,0) AS used_hours, Task.budgeted_hours,
	(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0 ELSE (COALESCE(Recorded_Hours.used_hours,0)/Task.budgeted_hours) END,0)*100) AS budget_used,
	(Task.due_date-Task.assigned_date)*1.0 AS given_days,
	EXTRACT(DAY FROM Task.complete_date-Task.assigned_date)*1.0 AS duration_days,
	(CASE WHEN Task.complete_date <= (Task.due_date+INTERVAL '86399 second') THEN 1.0 ELSE 0.0 END) AS on_time,
	(CASE WHEN (COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0.0 ELSE (COALESCE(Recorded_Hours.used_hours,0)/Task.budgeted_hours) END,0)*100) <= 100 THEN 1.0 ELSE 0.0 END) AS on_budget
FROM Customer
	INNER JOIN Project ON Customer.customer_id=Project.customer_id
	INNER JOIN Task ON Project.project_id=Task.project_id
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1<cfif attributes.show_completed>
		AND Link_Task_Task_Status.task_status_id!=7 /*exclude closed tasks*/</cfif>
	INNER JOIN REF_Task_Status ON Link_Task_Task_Status.task_status_id=REF_Task_Status.task_status_id<cfif isdefined("attributes.user_account_id")>
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1 /* owner */
		AND Team.user_account_id IN (#attributes.user_account_id#)</cfif><cfif attributes.show_budgeted_ind>
	INNER JOIN Forecast_Assignment ON Task.task_id=Forecast_Assignment.task_id
		AND Forecast_Assignment.active_ind=1</cfif>
	LEFT OUTER JOIN (
		SELECT task_id, SUM(COALESCE(Time_Entry.hours,0)) AS used_hours
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1<cfif isdefined("attributes.user_account_id")>
			AND Time_Entry.user_account_id IN (#attributes.user_account_id#)</cfif>
		GROUP BY Time_Entry.task_id
	) AS Recorded_Hours ON Task.task_id=Recorded_Hours.task_id
WHERE Task.assigned_date IS NOT NULL
	AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.through_date)#
</cfoutput>
<!---

/*Reports/sql_employee_force.cfm
	Author: Jeromy F */
<pre>
<cfoutput>
</cfoutput>
</pre> --->