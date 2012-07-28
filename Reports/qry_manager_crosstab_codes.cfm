
<!--Reports/qry_manager_crosstab_codes.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets all the codes and all the hours associated with a supervisor's subordinates.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="manager_crosstab_codes" datasource="#application.datasources.main#">
SELECT Project.project_code AS code, Project.project_id AS id,
	SUM(Time_Entry.hours) AS codetotal
FROM Time_Entry, Project,
	(SELECT #session.user_account_id# AS emp_id
	UNION ALL
	SELECT Emp_Contact.emp_id
	FROM Emp_Contact, Link_Company_Emp_Contact, <cfif variables.all_option>Demographics<cfelse>Link_Employee_Supervisor</cfif>
	WHERE Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id<cfif variables.all_option>
		AND Demographics.hire_date < #createodbcdatetime(attributes.through_date)#
		AND (Demographics.end_date IS NULL
			OR Demographics.end_date > #createodbcdatetime(attributes.from_date)#)<cfelse>
		AND Link_Employee_Supervisor.user_account_id=Emp_Contact.emp_id 
		AND Link_Employee_Supervisor.supervisor_id=#session.user_account_id#
		AND Link_Employee_Supervisor.date_start < #createodbcdatetime(attributes.through_date)#
		AND (Link_Employee_Supervisor.date_end IS NULL
			OR Link_Employee_Supervisor.date_end > #createodbcdatetime(attributes.from_date)#)</cfif>
		AND Link_Company_Emp_Contact.company_id IN (<cfif listlen(session.workstream_selected_company_id)>#session.workstream_selected_company_id#<cfelse>0</cfif>)
	) AS Elligible_Employees
WHERE Time_Entry.active_ind=1
	AND Time_Entry.project_id=Project.project_id
	AND Time_Entry.emp_id=Elligible_Employees.emp_id
	AND Time_entry.date >= #createodbcdatetime(attributes.from_date)#
	AND Time_entry.date <= #createodbcdatetime(attributes.through_date)#
GROUP BY Project.project_code, Project.project_id
ORDER BY code
</cfquery>
</cfsilent>
