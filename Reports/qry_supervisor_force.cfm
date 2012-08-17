
<!--Reports/qry_supervisor_force.cfm
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
<cfquery name="supervisor_force" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname || ', ' || Emp_Contact.name AS employee_name, 
	Emp_Contact.emp_id, 
	COALESCE(bdata.cbt,0) AS cbt, COALESCE(bdata.cbh,0) AS cbh, COALESCE(bdata.nbt,0) AS nbt, COALESCE(bdata.nbh,0) AS nbh, 
	COALESCE(nbdata.cnt,0) AS cnt, COALESCE(nbdata.cnh,0) AS cnh, COALESCE(nbdata.nnt,0) AS nnt, COALESCE(nbdata.nnh,0) AS nnh
FROM Demographics_Ngauge Demographics, Emp_Contact
	LEFT OUTER JOIN (
		SELECT COUNT(DISTINCT CASE WHEN Task.status_id=7 /*completed*/ THEN Forecast_Assignment.task_id ELSE NULL END) AS cbt, 
			COALESCE(SUM(CASE WHEN Task.status_id=7 /*completed*/ THEN Time_Entry.hours ELSE 0 END),0) AS cbh,
			COUNT(DISTINCT CASE WHEN Task.status_id!=7 /*exclude closed tasks*/ THEN Forecast_Assignment.task_id ELSE NULL END) AS nbt, 
			COALESCE(SUM(CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.hours ELSE 0 END),0) AS nbh,
			Forecast_Assignment.emp_id
		FROM Time_Entry <!--- $issue$: is this join right? --->
			RIGHT OUTER JOIN Forecast_Assignment ON Time_Entry.task_id=Forecast_Assignment.task_id
				AND Time_Entry.active_ind=1
				AND Forecast_Assignment.active_ind=1, 
			Task, Team
		WHERE Task.task_id=Forecast_Assignment.task_id
			AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.to_date)#
			AND Forecast_Assignment.emp_id=Team.emp_id
			AND Forecast_Assignment.task_id=Team.task_id
			AND Team.role_id=1
		GROUP BY Forecast_Assignment.emp_id
	) AS bdata ON bdata.emp_id=emp_contact.emp_id
	LEFT OUTER JOIN (
		SELECT COUNT(DISTINCT CASE WHEN task.status_id=7 /*completed*/ THEN Time_Entry.task_id ELSE NULL END) AS cnt, 
			COALESCE(SUM(CASE WHEN task.status_id=7 /*completed*/ THEN Time_Entry.hours ELSE 0 END),0) AS cnh,
			COUNT(DISTINCT CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.task_id ELSE NULL END) AS nnt, 
			COALESCE(SUM(CASE WHEN task.status_id!=7 /*exclude closed tasks*/ THEN Time_Entry.hours ELSE 0 END),0) AS nnh,
			Time_Entry.emp_id
		FROM Time_Entry 
			LEFT OUTER JOIN Forecast_Assignment ON Time_Entry.task_id=Forecast_Assignment.task_id
				AND Forecast_Assignment.active_ind=1, Task, Team
		WHERE Time_Entry.active_ind=1
			AND Task.task_id=Time_Entry.task_id
			AND Task.due_date BETWEEN #createodbcdatetime(attributes.from_date)# AND #createodbcdatetime(attributes.to_date)#
			AND Time_Entry.emp_id=Team.emp_id
			AND Time_Entry.task_id=Team.task_id
			AND Team.role_id=1
		GROUP BY Time_Entry.emp_id
	) AS nbdata ON nbdata.emp_id=emp_contact.emp_id 
WHERE Demographics.emp_id=Emp_Contact.emp_id
	AND Demographics.effective_to IS NULL
	AND Demographics.end_date IS NULL
	AND (Demographics.supervisor=#session.user_account_id# OR Demographics.emp_id=#session.user_account_id#)
</cfquery>
</cfsilent>

