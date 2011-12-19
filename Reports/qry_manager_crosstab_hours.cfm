
<!--Reports/qry_manager_crosstab_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets all the codes and all the hours associated with a supervisor's subordinates.

	||
	Edits:
	$Log: qry_manager_crosstab_hours.cfm,v $
	Revision 1.4  2005-12-02 14:52:59-05  french
	Removed hard-coded supervisor emp_id. Added supervisor data to output. Task 38058

	Revision 1.3  2005-03-09 13:14:06-05  stetzer
	<>

	Revision 1.2  2005-03-09 09:14:34-05  french
	Need closing ')' for subquery.

	Revision 1.1  2005-03-03 14:09:16-05  french
	Modified report to use Link_Employee_Supervisor table, where we now hold employee/Supervisor relationship data. Task 30220

	Revision 1.0  2005-02-15 15:57:53-05  daugherty
	Initial revision

	Revision 1.1  2001-10-11 11:03:55-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfquery name="manager_crosstab_hours" datasource="#application.datasources.main#">
SELECT Elligible_Employees.name,
	<cfloop query="manager_crosstab_codes">SUM(CASE WHEN Time_Entry.project_id = #manager_crosstab_codes.id# THEN Time_Entry.hours ELSE 0 END) AS 'code#manager_crosstab_codes.currentrow#',
	</cfloop>Elligible_Employees.emp_id, SUM(ISNULL(Time_Entry.hours,0)) AS total_hours
FROM Time_Entry,
	(SELECT Emp_Contact.emp_id, ISNULL(Emp_Contact.lname,'Unknown')+', '+ISNULL(Emp_Contact.name,'Unknown') AS name
	FROM Emp_Contact, Company, <cfif variables.all_option>Demographics<cfelse>Link_Employee_Supervisor</cfif>
	WHERE Emp_Contact.emp_id=Company.emp_id<cfif variables.all_option>
		AND Emp_Contact.emp_id=Demographics.emp_id
		AND Demographics.hire_date < #createodbcdatetime(attributes.through_date)#
		AND (Demographics.end_date IS NULL
			OR Demographics.end_date > #createodbcdatetime(attributes.from_date)#)<cfelse>
		AND Link_Employee_Supervisor.emp_id=Emp_Contact.emp_id 
		AND (Link_Employee_Supervisor.supervisor_id=#session.user_account_id#
			OR Link_Employee_Supervisor.emp_id=#session.user_account_id#)
		AND Link_Employee_Supervisor.date_start < #createodbcdatetime(attributes.through_date)#
		AND (Link_Employee_Supervisor.date_end IS NULL
			OR Link_Employee_Supervisor.date_end > #createodbcdatetime(attributes.from_date)#)</cfif>
		AND Company.company IN (<cfif listlen(session.workstream_company_select_list)>#session.workstream_company_select_list#<cfelse>0</cfif>)
	GROUP BY Emp_Contact.emp_id, ISNULL(Emp_Contact.lname,'Unknown')+', '+ISNULL(Emp_Contact.name,'Unknown')
	) AS Elligible_Employees
WHERE Time_Entry.emp_id=*Elligible_Employees.emp_id
	AND Time_Entry.project_id IN (#valuelist(manager_crosstab_codes.id)#)
	AND Time_Entry.date >= #createodbcdatetime(attributes.from_date)#
	AND Time_Entry.date <= #createodbcdatetime(attributes.through_date)#
GROUP BY Elligible_Employees.emp_id, Elligible_Employees.name
ORDER BY Elligible_Employees.name
</cfquery>
</cfsilent>