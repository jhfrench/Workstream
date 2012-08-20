
<!--report/qry_undertime_report_name.cfm
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
SELECT Elligible_Employees.emp_id, Elligible_Employees.name, Elligible_Employees.lname,
	Elligible_Employees.employee_classification, Project.description, SUM(Time_Entry.hours) AS hours
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN (
		SELECT Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname,
			REF_Employee_Classification.employee_classification
		FROM Emp_Contact
			INNER JOIN Demographics ON Demographics.emp_id=Emp_Contact.emp_id
				AND Demographics.hire_date < #createodbcdatetime(variables.end_date)#
				AND COALESCE(Demographics.end_date, CURRENT_DATE+interval '1 day') > #createodbcdatetime(variables.start_date)#
			LEFT OUTER JOIN REF_Employee_Classification ON Demographics.employee_classification_id=REF_Employee_Classification.employee_classification_id
			INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id<cfif NOT variables.all_option>
			INNER JOIN Link_Employee_Supervisor ON Link_Employee_Supervisor.user_account_id=Emp_Contact.emp_id 
				AND Link_Employee_Supervisor.supervisor_id=#session.user_account_id#
				AND Link_Employee_Supervisor.date_start < #createodbcdatetime(attributes.through_date)#
				AND COALESCE(Link_Employee_Supervisor.date_end, CURRENT_DATE+ interval '1 day') > #createodbcdatetime(attributes.from_date)#</cfif>
		WHERE 1=1<cfif listlen(session.workstream_selected_company_id)>
			AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)</cfif>
	) AS Elligible_Employees ON Time_Entry.emp_id=Elligible_Employees.emp_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date BETWEEN #createodbcdatetime(variables.start_date)# AND #createodbcdatetime(variables.end_date)#
GROUP BY Elligible_Employees.emp_id, Elligible_Employees.name, Elligible_Employees.lname,
	Elligible_Employees.employee_classification, Project.description
ORDER BY Elligible_Employees.lname, Elligible_Employees.name
</cfquery>
</cfsilent>
