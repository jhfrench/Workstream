
<!--Reports/qry_manager_crosstab_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets all the codes and all the hours associated with a supervisor's subordinates.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="manager_crosstab_hours" datasource="#application.datasources.main#">
SELECT Elligible_Employees.name,
	<cfloop query="manager_crosstab_codes">SUM(CASE WHEN Time_Entry.project_id = #manager_crosstab_codes.project_id# THEN Time_Entry.hours ELSE 0 END) AS 'code#manager_crosstab_codes.currentrow#',
	</cfloop>Elligible_Employees.user_account_id, SUM(COALESCE(Time_Entry.hours,0)) AS total_hours
FROM Time_Entry,
	(SELECT Demographics.user_account_id, COALESCE(Demographics.last_name,'Unknown') || ', ' || COALESCE(Demographics.first_name,'Unknown') AS name
	FROM Demographics, Link_Company_User_Account, <cfif variables.all_option>Demographics<cfelse>Link_User_Account_Supervisor</cfif>
	WHERE Demographics.user_account_id=Link_Company_User_Account.user_account_id<cfif variables.all_option>
		AND Demographics.user_account_id=Demographics.user_account_id
		AND Employee.hire_date < #createodbcdatetime(attributes.through_date)#
		AND (Employee.turnover_date IS NULL
			OR Employee.turnover_date > #createodbcdatetime(attributes.from_date)#)<cfelse>
		AND Link_User_Account_Supervisor.user_account_id=Demographics.user_account_id
		AND (Link_User_Account_Supervisor.supervisor_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
			OR Link_User_Account_Supervisor.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
		AND Link_User_Account_Supervisor.date_start < #createodbcdatetime(attributes.through_date)#
		AND (Link_User_Account_Supervisor.date_end IS NULL
			OR Link_User_Account_Supervisor.date_end > #createodbcdatetime(attributes.from_date)#)</cfif>
		AND Link_Company_User_Account.company_id IN (<cfif listlen(session.workstream_selected_company_id)>#session.workstream_selected_company_id#<cfelse>0</cfif>)
	GROUP BY Demographics.user_account_id, COALESCE(Demographics.last_name,'Unknown') || ', ' || COALESCE(Demographics.first_name,'Unknown')
	) AS Elligible_Employees
WHERE Time_Entry.user_account_id=*Elligible_Employees.user_account_id
	AND Time_Entry.project_id IN (#valuelist(manager_crosstab_codes.project_id)#)
	AND Time_Entry.active_ind=1
	AND Time_Entry.work_date >= #createodbcdatetime(attributes.from_date)#
	AND Time_Entry.work_date <= #createodbcdatetime(attributes.through_date)#
GROUP BY Elligible_Employees.user_account_id, Elligible_Employees.name
ORDER BY Elligible_Employees.name
</cfquery>
</cfsilent>