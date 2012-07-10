
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
SELECT Task.task_id AS task_id, (Customer.description || '-' || Project.description) AS engagement, Task.name AS task, 
	(CASE WHEN Project.billable_type_id = 3 THEN 'B' ELSE 'NB' END) AS billable, REF_Priority.description AS priority, 
	REF_Status.status AS status,
	Task.due_date AS date_due,
	Task.complete_date AS date_completed,
	COALESCE(Recorded_Hours.hours_used,0) AS hours_used,  
	Task.budgeted_hours AS budgeted_hours,
	(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0 ELSE (COALESCE(Recorded_Hours.hours_used,0)/Task.budgeted_hours) END,0)*100) AS budget_used,
	DATEDIFF(D,Task.assigned_date,Task.due_date)*1.0 AS given_days,
	DATEDIFF(D,Task.assigned_date,Task.complete_date)*1.0 AS duration_days,
	(CASE WHEN Task.complete_date <= DATEADD(S,86399,Task.due_date) THEN 1.0 ELSE 0.0 END) AS on_time,
	(CASE WHEN (COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0.0 ELSE (COALESCE(Recorded_Hours.hours_used,0)/Task.budgeted_hours) END,0)*100) <= 100 THEN 1.0 ELSE 0.0 END) AS on_budget
FROM Customer, Task, Project, REF_Priority, REF_Status, Team,<cfif isdefined("attributes.show_budgeted")> Forecast_Assignment,</cfif>
	(SELECT SUM(COALESCE(Time_Entry.hours,0)) AS hours_used, task_id
	FROM Time_Entry
	<cfif isdefined("variables.emp_id")>WHERE Time_Entry.emp_id IN (#variables.emp_id#)</cfif>
	GROUP BY Time_Entry.task_id)
AS Recorded_Hours
WHERE Customer.customer_id=Project.customer_id
	AND Task.project_id=Project.project_id
	AND Task.priority_id=REF_Priority.priority_id
	<cfif isdefined("variables.emp_id")>AND Team.emp_id IN (#variables.emp_id#)</cfif>
	AND Team.role_id=1
	AND Task.status_id=REF_Status.status_id
	AND Task.task_id=Team.task_id
	AND Task.task_id*=Recorded_Hours.task_id
	AND Task.assigned_date IS NOT NULL
	AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.to_date)#
	AND Task.status_id!=13
	<cfif isdefined("attributes.show_completed")>AND Task.status_id=11</cfif>
	<cfif isdefined("attributes.show_budgeted")>AND Forecast_Assignment.active_ind=1 AND Forecast_Assignment.task_id=Task.task_id</cfif>
</cfoutput>
<!--- 

/*Reports/sql_employee_force.cfm
	Author: Jeromy F */
<cfoutput>
SELECT Task.task_id AS task_id, Project.description AS engagement, Task.name AS task, 
	(CASE WHEN Project.billable_type_id = 3 THEN 'B' ELSE 'NB' END) AS billable, REF_Priority.description AS priority, 
	REF_Status.status AS status,
	Task.priority_id AS priority_id,
	Recorded_Hours.hours_used AS hours_used,  Task.budgeted_hours AS budgeted_hours, 
	(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0 ELSE (Recorded_Hours.hours_used/Task.budgeted_hours) END,0)*100) AS budget_used, 
	DATEDIFF(D, Task.complete_date, Task.due_date) AS days_before_deadline,
	DATEDIFF(D, Task.assigned_date, Task.due_date) AS days_to_do,
	DATEDIFF(D, Task.assigned_date, Task.complete_date) AS days_taken,
	CASE WHEN Project.billable_type_id = 3 THEN 10.0 ELSE 5.0 END AS billable_score,
	(CASE WHEN Task.status_id != 11 THEN NULL ELSE ((
		(CASE WHEN Project.billable_type_id = 3 THEN 10 ELSE 5 END*#variables.billable_weight#)+
		((6-Task.priority_id)*2*#priority_weight#)+
		(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 10 ELSE ((1-(COALESCE(Recorded_Hours.hours_used,0)/Task.budgeted_hours))*10) END,10)*#variables.time_percent_weight#)+
		((CASE WHEN DATEDIFF(D, Task.complete_date, Task.due_date) >= 0 THEN 10 ELSE 0 END) *#variables.on_time_weight#)<!--- +
		((CASE WHEN DATEDIFF(HH, Task.assigned_date, Task.due_date) != 0 THEN COALESCE((DATEDIFF(HH, Task.assigned_date, Task.complete_date)/DATEDIFF(HH, Task.assigned_date, Task.due_date)),1) ELSE 1 END )*10*#variables.days_before_weight#) --->
		)*10) END) AS efficiency_score
FROM Task, Project, REF_Priority, REF_Status,
	(SELECT Team.task_id
	FROM Team
	WHERE Team.emp_id = #variables.emp_id#
		AND Team.role_id=1
	GROUP BY Team.task_id)
AS Team,
	(SELECT SUM(COALESCE(Time_Entry.hours,0)) AS hours_used, task_id
	FROM Time_Entry
	WHERE Time_Entry.emp_id = #variables.emp_id#
	GROUP BY Time_Entry.task_id)
AS Recorded_Hours
WHERE Task.project_id=Project.project_id
	AND Task.priority_id=REF_Priority.priority_id
	AND Task.status_id=REF_Status.status_id
	AND Task.task_id=Team.task_id
	AND Task.task_id*=Recorded_Hours.task_id
	AND Task.assigned_date IS NOT NULL
	AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.to_date)#
	<cfif isdefined("attributes.show_completed")>AND Task.status_id=11</cfif>
</cfoutput> --->