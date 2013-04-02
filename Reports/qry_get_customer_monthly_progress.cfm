
<!--Reports/qry_get_customer_monthly_progress.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query the database for the information for the leadership hours report.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->

<cfquery name="get_customer_monthly_progress" datasource="#application.datasources.main#">
SELECT Project.project_id, Project.project_code, Project.description AS project_name,
	Task.task_id, Task.name AS task_name, Task.budgeted_hours,
	Task.due_date, Time_Entry.work_date, Time_Entry.hours, Notes.note
FROM Project
	INNER JOIN Task ON Project.project_id=Task.project_id
		AND Task.active_ind=1
	INNER JOIN Time_Entry ON Task.task_id=Time_Entry.task_id
		AND Time_Entry.active_ind=1
		AND EXTRACT(MONTH FROM Time_Entry.work_date)=<cfqueryparam value="#attributes.report_month#" cfsqltype="cf_sql_integer" />
		AND EXTRACT(YEAR FROM Time_Entry.work_date)=<cfqueryparam value="#attributes.report_year#" cfsqltype="cf_sql_integer" />
	INNER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
		AND Notes.active_ind=1
WHERE Project.active_ind=1
	AND Project.customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer" />
ORDER BY Project.project_code, Task.task_id, Time_Entry.work_date,
	Time_Entry.time_entry_id
</cfquery>
</cfsilent>