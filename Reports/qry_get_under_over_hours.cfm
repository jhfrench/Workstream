
<!--report/qry_get_under_over_hours.cfm
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
<cfquery name="get_under_over_hours" datasource="#application.datasources.main#">
SELECT Elligible_Employees.user_account_id, Elligible_Employees.name, Elligible_Employees.last_name,
	Elligible_Employees.employee_classification, Project.description, SUM(Time_Entry.hours) AS hours
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN (
		SELECT Demographics.user_account_id, Demographics.first_name, Demographics.last_name,
			REF_Employee_Classification.employee_classification
		FROM Demographics
			INNER JOIN Demographics ON Demographics.user_account_id=Demographics.user_account_id
				AND Employee.hire_date < #createodbcdatetime(variables.end_date)#
				AND COALESCE(Employee.turnover_date, CURRENT_DATE+interval '1 day') > #createodbcdatetime(variables.start_date)#
			LEFT OUTER JOIN REF_Employee_Classification ON Employee.employee_classification_id=REF_Employee_Classification.employee_classification_id
			INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id<cfif NOT variables.all_option>
			INNER JOIN Link_User_Account_Supervisor ON Link_User_Account_Supervisor.user_account_id=Demographics.user_account_id 
				AND Link_User_Account_Supervisor.supervisor_id=#variables.user_identification#
				AND Link_User_Account_Supervisor.date_start < #createodbcdatetime(attributes.through_date)#
				AND COALESCE(Link_User_Account_Supervisor.date_end, CURRENT_DATE+ interval '1 day') > #createodbcdatetime(attributes.from_date)#</cfif>
		WHERE 1=1<cfif listlen(session.workstream_selected_company_id)>
			AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)</cfif>
	) AS Elligible_Employees ON Time_Entry.user_account_id=Elligible_Employees.user_account_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date BETWEEN #createodbcdatetime(variables.start_date)# AND #createodbcdatetime(variables.end_date)#
GROUP BY Elligible_Employees.user_account_id, Elligible_Employees.name, Elligible_Employees.last_name,
	Elligible_Employees.employee_classification, Project.description
ORDER BY Elligible_Employees.last_name, Elligible_Employees.name
</cfquery>
</cfsilent>
