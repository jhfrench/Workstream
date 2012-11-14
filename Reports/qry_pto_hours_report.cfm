
<!--Reports/qry_pto_hours_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I populate the LCI version of the PTO report.

	||
	Edits:
	$Log$ 
	 || 
	END FUSEDOC --->
<cfquery name="get_pto_hours_report" datasource="#application.datasources.main#">
<cfif isdefined("attributes.drill_down")> 
SELECT Demographics.user_account_id, Demographics.first_name, Demographics.last_name,
	PTO_Hours.Pto_Type_Indicator, REF_Company.description AS company
FROM Demographics
	INNER JOIN PTO_Hours ON Demographics.user_account_id=PTO_Hours.user_account_id
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
	INNER JOIN REF_Company ON Link_Company_User_Account.company_id = REF_Company.company_id
WHERE Demographics.active_ind=1
	AND Link_Company_User_Account.company_id IN (
		SELECT company_id 
		FROM Security_Company_Access 
		WHERE user_account_id=#variables.user_identification#
	)
	AND Demographics.user_account_id IN ('#preservesinglequotes(attributes.drill_down)#')
ORDER BY Demographics.last_name, Demographics.first_name
<cfelse>
SELECT DISTINCT Demographics.user_account_id, Demographics.first_name, Demographics.last_name,
	Used_Hours.used_hours, PTO_Hours.pto_type_indicator
FROM Demographics
	INNER JOIN Security_Company_Access ON Demographics.user_account_id=Security_Company_Access.user_account_id
		AND Security_Company_Access.company_id IN (
			SELECT company_id 
			FROM Security_Company_Access 
			WHERE user_account_id=#variables.user_identification#
		)
	INNER JOIN PTO_Hours ON Demographics.user_account_id=PTO_Hours.user_account_id
	INNER JOIN Employee ON Demographics.user_account_id=Employee.user_account_id
		AND Employee.turnover_date IS NULL
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Demographics.user_account_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
	INNER JOIN (
		SELECT Link_Company_User_Account.user_account_id, COALESCE(SUM(Time_Entry.hours),0) AS used_hours
		FROM Link_Company_User_Account
			LEFT OUTER JOIN Time_Entry ON Link_Company_User_Account.user_account_id=Time_Entry.user_account_id
				AND Time_Entry.active_ind=1
				AND EXTRACT(YEAR FROM Time_Entry.work_date) = EXTRACT(YEAR FROM CURRENT_DATE)
				AND Time_Entry.project_id IN (
					SELECT project_id
					FROM Project
					WHERE project_id=#application.application_specific_settings.pto_project_id#
				)
		WHERE Link_Company_User_Account.company_id IN (
				SELECT company_id 
				FROM Security_Company_Access 
				WHERE user_account_id=#variables.user_identification#
			)
		GROUP BY Link_Company_User_Account.user_account_id
	) AS Used_Hours ON Demographics.user_account_id=Used_Hours.user_account_id
WHERE Demographics.active_ind=1<cfif NOT listcontainsnoCase(attributes.user_account_id,"ALL" )>
	AND Demographics.user_account_id IN (#preservesinglequotes(attributes.user_account_id)#)</cfif>
ORDER BY last_name
</cfif>
</cfquery>
</cfsilent>