
<!--Reports/qry_manager_crosstab_codes.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets all the codes and all the hours associated with a supervisor's subordinates.

	||
	Edits:
	$Log$
	Revision 1.2  2005/12/02 19:52:45  french
	Removed hard-coded supervisor emp_id. Added supervisor data to output. Task 38058

	Revision 1.1  2005-03-03 14:09:48-05  french
	Modified report to use Link_Employee_Supervisor table, where we now hold employee/Supervisor relationship data. Task 30220

	Revision 1.0  2005-02-15 15:57:52-05  daugherty
	Initial revision

	||
	END FUSEDOC --->
<cfquery name="manager_crosstab_codes" datasource="#application.datasources.main#">
SELECT Project.project_code AS code, Project.project_id AS id,
	SUM(Time_Entry.hours) AS codetotal
FROM Time_Entry, Project,
	(SELECT #session.user_account_id# AS emp_id
	UNION ALL
	SELECT Emp_Contact.emp_id
	FROM Emp_Contact, Company, <cfif variables.all_option>Demographics<cfelse>Link_Employee_Supervisor</cfif>
	WHERE Emp_Contact.emp_id=Company.emp_id<cfif variables.all_option>
		AND Demographics.hire_date < #createodbcdatetime(attributes.through_date)#
		AND (Demographics.end_date IS NULL
			OR Demographics.end_date > #createodbcdatetime(attributes.from_date)#)<cfelse>
		AND Link_Employee_Supervisor.emp_id=Emp_Contact.emp_id 
		AND Link_Employee_Supervisor.supervisor_id=#session.user_account_id#
		AND Link_Employee_Supervisor.date_start < #createodbcdatetime(attributes.through_date)#
		AND (Link_Employee_Supervisor.date_end IS NULL
			OR Link_Employee_Supervisor.date_end > #createodbcdatetime(attributes.from_date)#)</cfif>
		AND Company.company IN (<cfif listlen(session.workstream_company_select_list)>#session.workstream_company_select_list#<cfelse>0</cfif>)
	) AS Elligible_Employees	
WHERE Time_Entry.project_id=Project.project_id
	AND Time_Entry.emp_id=Elligible_Employees.emp_id
	AND Time_entry.date >= #createodbcdatetime(attributes.from_date)#
	AND Time_entry.date <= #createodbcdatetime(attributes.through_date)#
GROUP BY Project.project_code, Project.project_id
ORDER BY code
</cfquery>
</cfsilent>
