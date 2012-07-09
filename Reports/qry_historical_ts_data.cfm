
<!--Reports/qry_historical_ts_data.cfm
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
<cfquery name="historical_ts_data" datasource="#application.datasources.main#" cachedafter="02/02/1978">
SELECT YEAR(Turnaround_Times.entry_date) AS task_year, MONTH(Turnaround_Times.entry_date) AS task_month, 
	AVG(Turnaround_Times.assessment_turnaround_hours) AS average_assessment_hours, 
	AVG(Turnaround_Times.completion_turnaround_hours) AS average_completion_hours
FROM
	(SELECT Task.entry_date, 
		(DATEDIFF(n, Task.entry_date, MIN(Notes.created_date))/60.0) AS assessment_turnaround_hours,
		(DATEDIFF(n, Task.entry_date, ISNULL(Task.complete_date,GETDATE()))/60.0) AS completion_turnaround_hours
	FROM Task, Time_Entry, Notes, Project, REF_Product
	WHERE Task.task_id=Time_Entry.task_id
		AND Time_Entry.notes_id=Notes.notes_id
		AND Task.project_id=Project.project_id
		AND Project.product_id=REF_Product.product_id
		AND Task.name LIKE 'TS%'
		AND #session.workstream_cache_query#=#session.workstream_cache_query#
	GROUP BY Task.task_id, Task.entry_date, Task.complete_date)
AS Turnaround_Times
GROUP BY YEAR(Turnaround_Times.entry_date), MONTH(Turnaround_Times.entry_date)
ORDER BY task_year, task_month
</cfquery>
</cfsilent>

