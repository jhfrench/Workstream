
<!--Reports/qry_get_tech_support_historical.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves information about currently open tech support tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="get_tech_support_historical" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT EXTRACT(YEAR FROM Task_Dates.entry_date) AS task_year, EXTRACT(MONTH FROM Task_Dates.entry_date) AS task_month,
	AVG(EXTRACT(EPOCH FROM Task_Dates.initial_note_date-Task_Dates.entry_date)/3600) AS average_assessment_hours,
	AVG(EXTRACT(EPOCH FROM Task_Dates.complete_date-Task_Dates.entry_date)/3600) AS average_completion_hours
FROM (
	SELECT Task.entry_date, COALESCE(Initial_Assessment.created_date, CURRENT_TIMESTAMP) AS initial_note_date, COALESCE(Task.complete_date, CURRENT_TIMESTAMP) AS complete_date
	FROM Task
		LEFT OUTER JOIN (
			SELECT task_id, MIN(created_date) AS created_date
			FROM Notes
			WHERE active_ind=1
			GROUP BY task_id
		) Initial_Assessment ON Task.task_id=Initial_Assessment.task_id
	WHERE active_ind=1
		AND Task.name LIKE 'TS%'
		AND <cfqueryparam value="#attributes.report_last_updated#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#attributes.report_last_updated#" cfsqltype="cf_sql_timestamp" />
	) AS Task_Dates
GROUP BY EXTRACT(YEAR FROM Task_Dates.entry_date), EXTRACT(MONTH FROM Task_Dates.entry_date)
ORDER BY task_year, task_month
</cfquery>
</cfsilent>

