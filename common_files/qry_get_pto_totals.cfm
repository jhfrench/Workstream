
<!-- common_files/qry_get_pto_totals.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="get_carryover" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT COALESCE(carryover_limit, 40) AS carryover_limit
FROM PTO_Rollover
WHERE user_account_id=#variables.user_identification#
	AND rollover_year=EXTRACT(YEAR FROM CURRENT_DATE)-1
	AND #year(now())#=#year(now())#
</cfquery>
<cfif NOT len(get_carryover.carryover_limit)>
	<cfset variables.carryover_limit=40>
<cfelse>
	<cfset variables.carryover_limit=get_carryover.carryover_limit>
</cfif>
<cfquery name="get_pto_totals" cachedwithin="#createtimespan(0,0,10,0)#" datasource="#application.datasources.main#">
SELECT COALESCE(Carryover.user_account_id, PTO_Rollover.user_account_id) AS user_account_id,
	COALESCE(SUM(PTO_Rollover.pto_hours_earned), 0) AS pto_hours_earned, 
	COALESCE(
		CASE
			WHEN Carryover.rollover > #variables.carryover_limit# THEN #variables.carryover_limit# 
			ELSE rollover 
		END, 0
	) AS rollover
FROM (
		SELECT (MAX(hours_in) - MAX(hours_out)) AS rollover, user_account_id 
		FROM
			(
				SELECT SUM(COALESCE(Time_Entry.hours, 0)) AS hours_out, 0 AS hours_in, Time_Entry.user_account_id
				FROM Time_Entry
				WHERE Time_Entry.active_ind=1
					AND Time_Entry.user_account_id=#variables.user_identification#
					AND Time_Entry.project_id=#application.application_specific_settings.pto_project_id#
					AND Time_Entry.work_date >= (SELECT pto_start_date FROM REF_Company WHERE company_id=#session.workstream_company_id#) 
					AND EXTRACT(YEAR FROM Time_Entry.work_date) < EXTRACT(YEAR FROM CURRENT_DATE)
				GROUP BY Time_Entry.user_account_id
				UNION ALL
				SELECT 0 AS hours_out, SUM(COALESCE(PTO_Grant.granted_hours, 0)) AS hours_in, PTO_Grant.user_account_id
				FROM PTO_Grant
			 	WHERE PTO_Grant.user_account_id=#variables.user_identification#
					AND date_granted >= (SELECT pto_start_date FROM REF_Company WHERE company_id=#session.workstream_company_id#) 
					AND EXTRACT(YEAR FROM date_granted) < EXTRACT(YEAR FROM CURRENT_DATE)
				GROUP BY PTO_Grant.user_account_id
			) AS Previous_Years_Hours
		GROUP BY user_account_id
	) AS Carryover
	FULL OUTER JOIN (
		SELECT Employee.user_account_id,
			CASE 
				WHEN PTO_Rollover.pto_override > 0 THEN pto_override/12 
				ELSE (
					SELECT accrual_rate
					FROM REF_PTO_Hours
					WHERE COALESCE(EXTRACT(YEAR FROM CURRENT_DATE)-EXTRACT(YEAR FROM Employee.hire_date),0) BETWEEN REF_PTO_Hours.min_year AND REF_PTO_Hours.max_year
				) 
			END AS pto_hours_earned 
		FROM Link_Company_User_Account
			INNER JOIN ABCD_Months ON ABCD_Months.month > EXTRACT(MONTH FROM CURRENT_DATE)
				AND ABCD_Months.year=EXTRACT(YEAR FROM CURRENT_DATE)
			INNER JOIN REF_Company ON REF_Company.company_id=Link_Company_User_Account.company_id
			INNER JOIN Employee ON Link_Company_User_Account.user_account_id=Employee.user_account_id
				AND Employee.hire_date+INTERVAL '30 day' < CURRENT_TIMESTAMP /*employees are eligible for PTO only after 30 days*/
				AND CURRENT_DATE BETWEEN Employee.hire_date AND COALESCE(Employee.turnover_date, CURRENT_TIMESTAMP)
				AND Employee.user_account_id=#variables.user_identification#
			LEFT OUTER JOIN PTO_Rollover ON Employee.user_account_id=PTO_Rollover.user_account_id
				AND PTO_Rollover.rollover_year=EXTRACT(YEAR FROM CURRENT_DATE)
	) AS PTO_Rollover ON PTO_Rollover.user_account_id=Carryover.user_account_id
WHERE #application.last_updated#=#application.last_updated#
	AND #month(now())#=#month(now())#
GROUP BY Carryover.user_account_id, PTO_Rollover.user_account_id, rollover
</cfquery>
</cfsilent>
