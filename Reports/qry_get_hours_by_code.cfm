
<!--Reports/qry_get_hours_by_code.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the hours by code report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_hours_by_code" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.hours) AS hours, Project.project_code, Project.description AS project, 
	COALESCE(REF_Employee_Classification.employee_classification, 'Unknown') AS employee_classification
FROM Time_Entry
	INNER JOIN Employee ON Time_Entry.user_account_id=Employee.user_account_id
		AND Time_Entry.work_date BETWEEN Employee.hire_date AND COALESCE(Employee.turnover_date, Time_Entry.work_date)
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Link_Company_User_Account ON Employee.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
	INNER JOIN REF_Company ON Link_Company_User_Account.company_id=REF_Company.company_id
	LEFT OUTER JOIN REF_Employee_Classification ON Employee.employee_classification_id=REF_Employee_Classification.employee_classification_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date BETWEEN #createodbcdate(attributes.from_date)# AND #createodbcdate(attributes.through_date)#
GROUP BY Project.project_code, Project.description, REF_Employee_Classification.employee_classification
ORDER BY Project.project_code
</cfquery>

<cfquery name="get_hours_by_code_totals" dbtype="query">
SELECT SUM(hours) AS hours_total
FROM get_hours_by_code
</cfquery>