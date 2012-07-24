
<!-- reports/qry_get_pto_year_summary.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfquery name="get_pto_year_summary" datasource="#application.datasources.main#">
SELECT COALESCE(SUM(hours_out),0) AS hours_out, COALESCE(SUM(hours_in),0) AS hours_in, 
	EXTRACT(YEAR FROM transaction_date) AS transaction_year
FROM
	(SELECT COALESCE(Time_Entry.hours, 0) AS hours_out, 0 AS hours_in, 
		[date] AS transaction_date, 'Rollup of past PTO Usage' AS comments
	FROM Time_Entry
	WHERE Time_Entry.active_ind=1
		AND Time_Entry.emp_id=#attributes.emp_id#
		AND Time_Entry.project_id IN (SELECT project_id FROM Project WHERE project_type_id=1)
		AND [date] >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
	UNION ALL
	SELECT 0 AS hours_out, COALESCE(PTO_Grant.granted_hours, 0) AS hours_in, 
		date_granted AS transaction_date, 'Rollup of past PTO Usage' AS comments
	FROM PTO_Grant
  		WHERE PTO_Grant.emp_id=#attributes.emp_id#
		AND date_granted >= #createodbcdatetime(Get_PTO_Start.pto_start_date)#
) Previous_Years_PTO
GROUP BY EXTRACT(YEAR FROM transaction_date)
ORDER BY EXTRACT(YEAR FROM transaction_date)
</cfquery>
</cfsilent>
