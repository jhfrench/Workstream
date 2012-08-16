
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
SELECT Elligible_Employees.name, Elligible_Employees.lname, Elligible_Employees.employee_classification, 
	Elligible_Employees.emp_id, Project.description, SUM(Time_Entry.hours) AS hours
FROM Time_Entry, Project,
	(SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id, REF_Employee_Classification.employee_classification
	FROM Emp_Contact, Demographics, REF_Employee_Classification,
		Link_Company_Emp_Contact<cfif NOT variables.all_option>, Supervisor</cfif>
	WHERE Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
		AND Demographics.emp_id=Emp_Contact.emp_id
		AND Demographics.employee_classification_id*=REF_Employee_Classification.employee_classification_id<cfif NOT variables.all_option>
		AND Supervisor.user_account_id=Emp_Contact.emp_id 
		AND Supervisor.supervisor_user_account_id = #session.user_account_id#</cfif>
		AND Link_Company_Emp_Contact.company_id IN (<cfif listlen(session.workstream_selected_company_id)>#session.workstream_selected_company_id#<cfelse>0</cfif>)
		AND Demographics.hire_date < #createodbcdatetime(variables.end_date)#
		AND (Demographics.end_date IS NULL
			OR Demographics.end_date > #createodbcdatetime(variables.start_date)#))
	AS Elligible_Employees
WHERE Time_Entry.emp_id=Elligible_Employees.emp_id
	AND Time_Entry.project_id=Project.project_id
	AND Time_Entry.active_ind=1
	AND Time_entry.date >= #createodbcdatetime(variables.start_date)#
	AND Time_entry.date <= #createodbcdatetime(variables.end_date)#
GROUP BY Elligible_Employees.name, Elligible_Employees.lname, Elligible_Employees.employee_classification, 
	Elligible_Employees.emp_id, Project.description
ORDER BY Elligible_Employees.lname, Elligible_Employees.name
</cfquery>
</cfsilent>
