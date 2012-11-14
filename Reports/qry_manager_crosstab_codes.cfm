
<!--Reports/qry_manager_crosstab_codes.cfm
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
<cfquery name="manager_crosstab_codes" datasource="#application.datasources.main#">
SELECT Project.project_code AS code, Project.project_id, SUM(Time_Entry.hours) AS codetotal
FROM Time_Entry
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN (
		SELECT #variables.user_identification# AS user_account_id
		UNION ALL
		SELECT Demographics.user_account_id
		FROM Demographics
			INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id<cfif variables.all_option>
			INNER JOIN Demographics ON Demographics.hire_date < #createodbcdatetime(attributes.through_date)#
				AND COALESCE(Demographics.effective_to, CURRENT_DATE+ interval '1 day') > #createodbcdatetime(attributes.from_date)# IS NULL<cfelse>
			INNER JOIN Link_User_Account_Supervisor ON Link_User_Account_Supervisor.user_account_id=Demographics.user_account_id 
				AND Link_User_Account_Supervisor.supervisor_id=#variables.user_identification#
				AND Link_User_Account_Supervisor.date_start < #createodbcdatetime(attributes.through_date)#
				AND COALESCE(Link_User_Account_Supervisor.date_end, CURRENT_DATE+ interval '1 day') > #createodbcdatetime(attributes.from_date)#</cfif>
		WHERE 1=1<cfif listlen(session.workstream_selected_company_id)>
			AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)</cfif>
	) AS Elligible_Employees ON Time_Entry.user_account_id=Elligible_Employees.user_account_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.work_date BETWEEN #createodbcdatetime(attributes.from_date)# AND#createodbcdatetime(attributes.through_date)#
GROUP BY Project.project_code, Project.project_id
ORDER BY code
</cfquery>
</cfsilent>
