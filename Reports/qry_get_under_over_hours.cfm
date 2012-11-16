
<!-- Reports/qry_get_under_over_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets the people for the undertime report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_under_over_hours" datasource="#application.datasources.main#">
SELECT REF_Employee_Classification.employee_classification, Project.description AS project_description, SUM(Time_Entry.hours) AS hours
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Employee ON Time_Entry.user_account_id=Employee.user_account_id
		AND Employee.active_ind=1
	LEFT OUTER JOIN REF_Employee_Classification ON Employee.employee_classification_id=REF_Employee_Classification.employee_classification_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date BETWEEN #createodbcdatetime(variables.start_date)# AND #createodbcdatetime(variables.end_date)#
	AND Time_Entry.user_account_id=#get_subordinates.user_account_id#
GROUP BY Elligible_Employees.employee_classification, Project.description
ORDER BY Project.description
</cfquery>

<cfquery name="get_under_over_hours_total" dbtype="query">
SELECT SUM(hours) AS total_hours
FROM get_under_over_hours
</cfquery>