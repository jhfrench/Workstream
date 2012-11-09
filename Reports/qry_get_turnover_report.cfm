
<!--Reports/qry_get_turnover_report.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query out the population and total count of separations (grouped by separation type, quarter, and year) for a given company.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	<-- #reason_desc#: string that contains variable--name of variable is populated from REF_separation_reason table
	<-- pop: total number of employees employed within a given quarter
	<-- date_year: year data reflects
	<-- date_quarter: quarter data reflects
	END FUSEDOC --->
</cfsilent>

<!--- <cfoutput>
<pre>
</pre>
</cfoutput> --->
<cfquery name="get_turnover_report" datasource="#application.datasources.main#">
SELECT Quarter_Population.date_year, Quarter_Population.date_quarter, Quarter_Population.population_count,<cfloop query="get_ref_turnover_reason">
	COALESCE(Turnover.turnover_reason_id_#turnover_reason_id#,0) AS turnover_reason_id_#turnover_reason_id#,</cfloop> 1 AS for_sql_syntax
FROM ( 
		SELECT ABCD_Quarter.date_year, ABCD_Quarter.date_quarter, COUNT(Population.user_account_id) AS population_count 
		FROM ABCD_Quarter
			LEFT OUTER JOIN ( 
				SELECT Employee.user_account_id, Employee.hire_date, COALESCE(Employee.turnover_date, CURRENT_DATE+ INTERVAL '1 day') AS turnover_date
				FROM Employee
					INNER JOIN Link_Company_User_Account ON Employee.user_account_id=Link_Company_User_Account.user_account_id
						AND Link_Company_User_Account.active_ind=1
						AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
				WHERE Employee.active_ind=1
			) AS Population ON ABCD_Quarter.date_end >= Population.hire_date
				AND ABCD_Quarter.date_start <= Population.turnover_date
		WHERE ABCD_Quarter.date_start < CURRENT_DATE 
			AND ABCD_Quarter.date_end > '2011-09-01' 
		GROUP BY ABCD_Quarter.date_year, ABCD_Quarter.date_quarter 
	) AS Quarter_Population 
	LEFT OUTER JOIN (
		SELECT EXTRACT(YEAR FROM Employee.turnover_date) AS turnover_year, EXTRACT(QUARTER FROM Employee.turnover_date) AS turnover_quarter,<cfloop query="get_ref_turnover_reason">
			SUM(CASE WHEN Employee.turnover_reason_id=#turnover_reason_id# THEN 1 ELSE 0 END) AS turnover_reason_id_#turnover_reason_id#,</cfloop> 1 AS for_sql_syntax
		FROM Employee
		WHERE Employee.active_ind=1
			AND Employee.turnover_date IS NOT NULL
		GROUP BY EXTRACT(YEAR FROM Employee.turnover_date), EXTRACT(QUARTER FROM Employee.turnover_date)
	) AS Turnover ON Quarter_Population.date_year=Turnover.turnover_year
		AND Quarter_Population.date_quarter=Turnover.turnover_quarter
ORDER BY Quarter_Population.date_year, Quarter_Population.date_quarter
</cfquery>

<cfquery name="get_turnover_report_total" dbtype="query">
SELECT <cfloop query="get_ref_turnover_reason">SUM(turnover_reason_id_#turnover_reason_id#) AS turnover_reason_id_#turnover_reason_id#,
	</cfloop> 1 AS for_sql_syntax
FROM get_turnover_report
</cfquery>

<cfquery name="get_total_population" datasource="#application.datasources.main#">
SELECT COUNT(Employee.user_account_id) AS total_population
FROM Employee
	INNER JOIN Link_Company_User_Account ON Employee.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.active_ind=1
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
WHERE Employee.active_ind=1
</cfquery>
