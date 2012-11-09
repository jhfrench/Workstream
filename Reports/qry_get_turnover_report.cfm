
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
	COALESCE(Turnover.turnover_reason_id_#turnover_reason_id#,0) AS turnover_reason_id_#turnover_reason_id#,</cfloop>1 AS for_sql_syntax
FROM (
		SELECT ABCD_Quarter.date_year, ABCD_Quarter.date_quarter, COUNT(Demographics.demographics_id) AS population_count
		FROM ABCD_Quarter
			LEFT OUTER JOIN (
				SELECT View_Demographics_Workstream.demographics_id, View_Demographics_Workstream.hire_date, COALESCE(View_Demographics_Workstream.effective_to, CURRENT_DATE+ INTERVAL '1 day') AS effective_to
				FROM View_Demographics_Workstream
					INNER JOIN Link_Company_User_Account ON View_Demographics_Workstream.user_account_id=Link_Company_User_Account.user_account_id
						AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
			) AS Demographics ON Demographics.hire_date <= ABCD_Quarter.date_end
				AND Demographics.effective_to >= ABCD_Quarter.date_start
		WHERE ABCD_Quarter.date_start < CURRENT_DATE
			AND ABCD_Quarter.date_end > '#application.application_specific_settings.workstream_start_date#'
		GROUP BY ABCD_Quarter.date_year, ABCD_Quarter.date_quarter
	) AS Quarter_Population
	LEFT OUTER JOIN (
		SELECT EXTRACT(YEAR FROM created_date) AS turnover_year, EXTRACT(QUARTER FROM created_date) AS turnover_quarter,<cfloop query="get_ref_turnover_reason">,
			SUM(CASE WHEN Turnover.reason_id=#turnover_reason_id# THEN 1 ELSE 0 END) AS turnover_reason_id_#turnover_reason_id#</cfloop>
		FROM Turnover
		GROUP BY EXTRACT(YEAR FROM created_date), EXTRACT(QUARTER FROM created_date)
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
SELECT COUNT(View_Demographics_Workstream.demographics_id) AS total_population
FROM View_Demographics_Workstream
	INNER JOIN Link_Company_User_Account ON View_Demographics_Workstream.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
</cfquery>
