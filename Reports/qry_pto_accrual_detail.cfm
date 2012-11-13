
<!--Reports/qry_pto_accrual_detail.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="PTO_Hours" datasource="#application.datasources.main#">
SELECT *
FROM 
	(SELECT Time_Rollover_From_2000 as hours_in, 0 as hours_out, '2001-01-01' as transaction_date
	FROM PTO_Hours
	WHERE (user_account_id=#page_pin#) AND COALESCE(Time_Rollover_From_2000,0) > 0
	UNION ALL
	SELECT (CASE WHEN PTO_Hours.pto_type_indicator =0 THEN (REF_PTO_Hours.Accrual_Rate * 8) ELSE (PTO_Hours.pto_type_indicator/12) END) AS hours_in, 
		0.0 AS hours_out, 
		Emp_Duration.start AS transaction_date
	FROM REF_PTO_Hours, PTO_Hours,
		(SELECT DATEDIFF(mm, (CASE WHEN EXTRACT(DAY FROM demographics.hire_date) > 15 THEN DATEADD(mm,1,demographics.hire_date) ELSE demographics.hire_date END), ABCD_Months.Start) AS duration, ABCD_Months.Start
		FROM ABCD_Months, demographics
		WHERE (demographics.user_account_id=#page_pin#) 
		AND ABCD_Months.Start > demographics.hire_date
		AND (ABCD_Months.Start < CURRENT_TIMESTAMP) 
		AND ABCD_Months.Start > '1/1/2001')
	as Emp_Duration 
	WHERE PTO_Hours.user_account_id=#page_pin# AND Emp_Duration.duration BETWEEN REF_PTO_Hours.Min_Month AND REF_PTO_Hours.Max_month
	UNION ALL
	SELECT 0.0 AS hours_in, Time_entry.hours AS hours_out, Time_Entry.work_date AS transaction_date
	FROM Time_entry
	WHERE Time_Entry.active_ind=1
		AND user_account_id=#variables.page_pin#
		AND project_id IN (
			SELECT Project_id
			FROM Project
			WHERE project_id=#application.application_specific_settings.pto_project_id#
		)
	) AS PTO_table
GROUP BY PTO_table.hours_in, PTO_table.hours_out, PTO_table.transaction_date
ORDER BY transaction_date, hours_out
</cfquery>
</cfsilent>

