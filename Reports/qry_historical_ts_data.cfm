
<!--Reports/qry_historical_ts_data.cfm
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
<cfquery name="historical_ts_data" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT EXTRACT(YEAR FROM Turnaround_Times.entry_date) AS task_year, EXTRACT(MONTH FROM Turnaround_Times.entry_date) AS task_month,
	AVG(Turnaround_Times.assessment_turnaround_hours) AS average_assessment_hours,
	AVG(Turnaround_Times.completion_turnaround_hours) AS average_completion_hours
FROM
	(SELECT Task.entry_date,
		(DATEDIFF(n, Task.entry_date, MIN(Notes.created_date))/60.0) AS assessment_turnaround_hours,
		(DATEDIFF(n, Task.entry_date, COALESCE(Task.complete_date,CURRENT_TIMESTAMP))/60.0) AS completion_turnaround_hours
	FROM Task, Time_Entry, Notes, Project, REF_Product
	WHERE Task.task_id=Time_Entry.task_id
		AND Time_Entry.notes_id=Notes.notes_id
		AND Notes.active_ind=1
		AND Task.project_id=Project.project_id
		AND Project.product_id=REF_Product.product_id
		AND Time_Entry.active_ind=1
		AND Task.name LIKE 'TS%'
		AND #attributes.report_last_updated#=#attributes.report_last_updated#
	GROUP BY Task.task_id, Task.entry_date, Task.complete_date)
AS Turnaround_Times
GROUP BY EXTRACT(YEAR FROM Turnaround_Times.entry_date), EXTRACT(MONTH FROM Turnaround_Times.entry_date)
ORDER BY task_year, task_month
</cfquery>
</cfsilent>

