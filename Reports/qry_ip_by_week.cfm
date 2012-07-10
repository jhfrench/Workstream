
<!--Reports/qry_ip_by_week.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves the weekly data for implementations.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	<-- days_to_complete: number of days it takes to complete an average IP started in the given week
	<-- task_count: number of IPs created in the given week
	<-- week_entered: number that corresponds to the week the IP was created
	<-- year_entered: year that IP was created
	END FUSEDOC --->
<cfquery name="ip_by_week" datasource="#application.datasources.main#">
SELECT COUNT(Task.task_id) AS task_count,
	valid_weeks.week_in_year AS week_entered, valid_weeks.year_num AS year_entered,
	COALESCE((AVG(DATEDIFF(hh,entry_date,complete_date))/24.00),0.00) AS days_to_complete
FROM Task,
	(SELECT DATEPART(wk,REF_Date.date) AS week_in_year, REF_Date.date_year AS year_num
	FROM REF_Date
	WHERE date>
		(SELECT MIN(Task.entry_date) AS earliest_date
		FROM Task
		WHERE tasks_pre_defined_id=55
			AND complete_date IS NOT NULL)
		AND date<
		(SELECT MAX(Task.entry_Date) AS earliest_date
		FROM Task
		WHERE tasks_pre_defined_id=55
			AND complete_date IS NOT NULL)
	GROUP BY DATEPART(wk,REF_Date.odbc_date), REF_Date.date_year)
AS valid_weeks
WHERE valid_weeks.week_in_year*=DATEPART(wk,entry_date)
	AND valid_weeks.year_num*=YEAR(entry_date)
	AND tasks_pre_defined_id=55
	AND complete_date IS NOT NULL
GROUP BY DATEPART(wk,entry_date), valid_weeks.year_num, valid_weeks.week_in_year
ORDER BY valid_weeks.year_num, valid_weeks.week_in_year
</cfquery>
</cfsilent>

