
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
SELECT Emp_Contact.lname || ', ' || Emp_Contact.name AS employee_name, 
	Emp_Contact.user_account_id, 
	COALESCE(bdata.cbt,0) AS cbt, COALESCE(bdata.cbh,0) AS cbh, COALESCE(bdata.nbt,0) AS nbt, COALESCE(bdata.nbh,0) AS nbh, 
	COALESCE(nbdata.cnt,0) AS cnt, COALESCE(nbdata.cnh,0) AS cnh, COALESCE(nbdata.nnt,0) AS nnt, COALESCE(nbdata.nnh,0) AS nnh
FROM View_Demographics_Workstream Demographics, Emp_Contact
	LEFT OUTER JOIN (
		SELECT COUNT(DISTINCT CASE WHEN Task.status_id=7 /*completed*/ THEN Forecast_Assignment.task_id ELSE NULL END) AS cbt, 
			COALESCE(SUM(CASE WHEN Task.status_id=7 /*completed*/ THEN Time_Entry.hours ELSE 0 END),0) AS cbh,
			COUNT(DISTINCT CASE WHEN Task.status_id!=7 /*exclude closed tasks*/ THEN Forecast_Assignment.task_id ELSE NULL END) AS nbt, 
			COALESCE(SUM(CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.hours ELSE 0 END),0) AS nbh,
			Forecast_Assignment.user_account_id
		FROM Time_Entry 
			RIGHT OUTER JOIN Forecast_Assignment ON Time_Entry.task_id=Forecast_Assignment.task_id
				AND Forecast_Assignment.active_ind=1
			INNER JOIN Task ON Task.task_id=Forecast_Assignment.task_id
				AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.to_date)#
			INNER JOIN Team ON Forecast_Assignment.user_account_id=Team.user_account_id
				AND Forecast_Assignment.task_id=Team.task_id
				AND Team.active_ind=1
				AND Team.role_id=1
		WHERE Time_Entry.active_ind=1
		GROUP BY Forecast_Assignment.user_account_id
	) AS bdata ON bdata.user_account_id=Emp_Contact.user_account_id
	LEFT OUTER JOIN (
		SELECT COUNT(DISTINCT CASE WHEN task.status_id=7 /*completed*/ THEN Time_Entry.task_id ELSE NULL END) AS cnt, 
			COALESCE(SUM(CASE WHEN task.status_id=7 /*completed*/ THEN Time_Entry.hours ELSE 0 END),0) AS cnh,
			COUNT(DISTINCT CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.task_id ELSE NULL END) AS nnt, 
			COALESCE(SUM(CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.hours ELSE 0 END),0) AS nnh,
			Time_Entry.user_account_id
		FROM Time_Entry 
			LEFT OUTER JOIN Forecast_Assignment ON Time_Entry.task_id=Forecast_Assignment.task_id
				AND Forecast_Assignment.active_ind=1
			INNER JOIN Task ON Task.task_id=Time_Entry.task_id
				AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.to_date)#
			INNER JOIN Team ON Time_Entry.user_account_id=Team.user_account_id
				AND Time_Entry.task_id=Team.task_id
				AND Time_Entry.active_ind=1<!--- $issue$ perhaps Team also needs date_deleted so we can look at historical relationships like this one--->
				AND Team.role_id=1
		WHERE Time_Entry.active_ind=1
		GROUP BY Time_Entry.user_account_id
	) AS nbdata ON nbdata.user_account_id=Emp_Contact.user_account_id 
WHERE Demographics.user_account_id=Emp_Contact.user_account_id
	AND Demographics.effective_to IS NULL
	AND (Demographics.supervisor=#variables.user_identification#
		OR Demographics.user_account_id=#variables.user_identification#)
</cfquery>
</cfsilent>

