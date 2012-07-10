
<!--Reports/qry_ts_task_count.cfm
	Author: Jeromy F  -->
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
<cfquery name="ts_task_count" datasource="#application.datasources.main#" cachedafter="02/02/1978">
SELECT EXTRACT(YEAR FROM Task.entry_date) AS task_year, EXTRACT(MONTH FROM Task.entry_date) AS task_month, 
	COUNT(Task.task_id) AS task_count
FROM Task
WHERE Task.name LIKE 'TS%'
	AND #session.workstream_cache_query#=#session.workstream_cache_query#
GROUP BY EXTRACT(YEAR FROM Task.entry_date), EXTRACT(MONTH FROM Task.entry_date)
ORDER BY task_year, task_month
</cfquery>
</cfsilent>

