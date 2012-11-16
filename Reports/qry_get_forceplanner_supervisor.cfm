
<!--Reports/qry_get_forceplanner_supervisor.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve tasks from the timekeeping database based on the environment and needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<!--- $issue$: this query probably needs to be rewritten --->
<cfquery name="get_forceplanner_supervisor" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name || ', ' || Demographics.first_name AS employee_name, 
	COALESCE(Budgeted_Data.cbt,0) AS cbt, COALESCE(Budgeted_Data.cbh,0) AS cbh, COALESCE(Budgeted_Data.nbt,0) AS nbt, COALESCE(Budgeted_Data.nbh,0) AS nbh, 
	COALESCE(Non_Budgeted_Data.cnt,0) AS cnt, COALESCE(Non_Budgeted_Data.cnh,0) AS cnh, COALESCE(Non_Budgeted_Data.nnt,0) AS nnt, COALESCE(Non_Budgeted_Data.nnh,0) AS nnh
FROM Employee
	INNER JOIN Demographics ON Employee.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Link_Employee_Supervisor ON Employee.user_account_id=Link_Employee_Supervisor.user_account_id
		AND Link_Employee_Supervisor.active_ind=1
		AND (Link_Employee_Supervisor.supervisor_id=#variables.user_identification#
			OR Link_Employee_Supervisor.user_account_id=#variables.user_identification#)
	LEFT OUTER JOIN (
		SELECT COUNT(DISTINCT CASE WHEN Task.status_id=7 /*completed*/ THEN Forecast_Assignment.task_id ELSE NULL END) AS cbt, 
			COALESCE(SUM(CASE WHEN Task.status_id=7 /*completed*/ THEN Time_Entry.hours ELSE 0 END),0) AS cbh,
			COUNT(DISTINCT CASE WHEN Task.status_id!=7 /*exclude closed tasks*/ THEN Forecast_Assignment.task_id ELSE NULL END) AS nbt, 
			COALESCE(SUM(CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.hours ELSE 0 END),0) AS nbh,
			Forecast_Assignment.user_account_id
		FROM Forecast_Assignment
			LEFT OUTER JOIN Time_Entry ON Forecast_Assignment.task_id=Time_Entry.task_id
				AND Time_Entry.active_ind=1
			INNER JOIN Task ON Task.task_id=Forecast_Assignment.task_id
				AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.through_date)#
			INNER JOIN Team ON Forecast_Assignment.user_account_id=Team.user_account_id
				AND Forecast_Assignment.task_id=Team.task_id
				AND Team.active_ind=1
				AND Team.role_id=1
		WHERE Forecast_Assignment.active_ind=1
		GROUP BY Forecast_Assignment.user_account_id
	) AS Budgeted_Data ON Budgeted_Data.user_account_id=Demographics.user_account_id
	LEFT OUTER JOIN (
		SELECT COUNT(DISTINCT CASE WHEN task.status_id=7 /*completed*/ THEN Time_Entry.task_id ELSE NULL END) AS cnt, 
			COALESCE(SUM(CASE WHEN task.status_id=7 /*completed*/ THEN Time_Entry.hours ELSE 0 END),0) AS cnh,
			COUNT(DISTINCT CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.task_id ELSE NULL END) AS nnt, 
			COALESCE(SUM(CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.hours ELSE 0 END),0) AS nnh,
			Time_Entry.user_account_id
		FROM Time_Entry
			INNER JOIN Task ON Task.task_id=Time_Entry.task_id
				AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.through_date)#
			INNER JOIN Team ON Time_Entry.user_account_id=Team.user_account_id
				AND Time_Entry.task_id=Team.task_id
				AND Time_Entry.active_ind=1<!--- $issue$ perhaps Team also needs date_deleted so we can look at historical relationships like this one--->
				AND Team.role_id=1
		WHERE Time_Entry.active_ind=1
		GROUP BY Time_Entry.user_account_id
	) AS Non_Budgeted_Data ON Non_Budgeted_Data.user_account_id=Demographics.user_account_id 
WHERE Employee.active_ind=1
	AND Employee.hire_date < #createodbcdatetime(attributes.through_date)#
	AND COALESCE(Employee.turnover_date, #createodbcdatetime(dateadd("d", 1, attributes.from_date))#) > #createodbcdatetime(attributes.from_date)#
</cfquery>
</cfsilent>
