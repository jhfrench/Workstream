
<!--Reports/qry_ts_task_count.cfm
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
<cfquery name="ts_task_count" cachedwithin="#createtimespan(attributes.report_cached_within)#" datasource="#application.datasources.main#">
SELECT EXTRACT(YEAR FROM Task.entry_date) AS task_year, EXTRACT(MONTH FROM Task.entry_date) AS task_month,
	COUNT(Task.task_id) AS task_count
FROM Task
WHERE LOWER(Task.name) LIKE 'ts%'
GROUP BY EXTRACT(YEAR FROM Task.entry_date), EXTRACT(MONTH FROM Task.entry_date)
ORDER BY task_year, task_month
</cfquery>
</cfsilent>