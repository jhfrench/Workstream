
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
SELECT Task.task_id, (Customer.description || '-' || Project.description) AS engagement, Task.name AS task, 
	(CASE WHEN Project.billable_type_id = 2 THEN 'NB' ELSE 'B' END) AS billable, REF_Priority.description AS priority, 
	REF_Status.status, Task.due_date AS date_due, Task.complete_date AS date_completed,
	COALESCE(Recorded_Hours.hours_used,0) AS hours_used, Task.budgeted_hours,
	(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0 ELSE (COALESCE(Recorded_Hours.hours_used,0)/Task.budgeted_hours) END,0)*100) AS budget_used,
	(Task.due_date-Task.assigned_date)*1.0 AS given_days,
	(Task.complete_date-Task.assigned_date)*1.0 AS duration_days,
	(CASE WHEN Task.complete_date <= (Task.due_date+INTERVAL '86399 second') THEN 1.0 ELSE 0.0 END) AS on_time,
	(CASE WHEN (COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0.0 ELSE (COALESCE(Recorded_Hours.hours_used,0)/Task.budgeted_hours) END,0)*100) <= 100 THEN 1.0 ELSE 0.0 END) AS on_budget
FROM Customer
	INNER JOIN Project ON Customer.customer_id=Project.customer_id
	INNER JOIN Task ON Project.project_id=Task.project_id
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
	INNER JOIN REF_Status ON Task.status_id=REF_Status.status_id<cfif isdefined("attributes.emp_id")>
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.role_id=1
		AND Team.emp_id IN (#attributes.emp_id#)</cfif><cfif isdefined("attributes.show_budgeted")>
	INNER JOIN Forecast_Assignment ON Task.task_id=Forecast_Assignment.task_id
		AND Forecast_Assignment.active_ind=1</cfif>
	LEFT OUTER JOIN (
		SELECT task_id, SUM(COALESCE(Time_Entry.hours,0)) AS hours_used
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1<cfif isdefined("attributes.emp_id")>
			AND Time_Entry.emp_id IN (#attributes.emp_id#)</cfif>
		GROUP BY Time_Entry.task_id
	) AS Recorded_Hours ON Task.task_id=Recorded_Hours.task_id
WHERE Task.assigned_date IS NOT NULL
	AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.to_date)#<cfif NOT isdefined("attributes.show_completed")>
	AND Task.status_id!=7 /*exclude closed tasks*/</cfif>
</cfoutput>
<!--- 

/*Reports/sql_employee_force.cfm
	Author: Jeromy F */
<pre>
<cfoutput>
</cfoutput>
</pre> --->