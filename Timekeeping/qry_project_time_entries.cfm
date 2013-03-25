
<!--Timekeeping/qry_project_time_entries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the time entries for an employee.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfquery name="project_time_entries" datasource="#application.datasources.main#">
SELECT Time_Entry.time_entry_id AS ID, Hours_Pin_Week.sumhoursweek,
	Hours_Pin_Week.week, Hours_Pin_Week.year,
	(CAST(ROUND(Time_Entry.hours,2) AS VARCHAR(25)) || '-' || LEFT(Project.project_code,22) || '(' || LEFT(Project.description,22) || ') ' || ' - ' || CAST(notes.note AS VARCHAR(70))) AS clientname_data,
	(CAST(REF_Day_Of_Week.day_name AS VARCHAR(9)) || ', ' || CAST(EXTRACT(MONTH FROM Time_Entry.work_date) AS VARCHAR(2)) || '/' || CAST(EXTRACT(DAY FROM Time_Entry.work_date) AS VARCHAR(11)) || '/' || CAST (CAST(right(EXTRACT(YEAR FROM Time_Entry.work_date),2) AS VARCHAR(11)) AS VARCHAR(11)) || '- ' || CAST(hours_pin_date.sumhours AS VARCHAR(11))) AS Workdays,
	('Week Beginning ' || CAST(DateName(month,Hours_Pin_Week.mindate) AS VARCHAR(9)) || ' ' || CAST(EXTRACT(DAY FROM Hours_Pin_Week.mindate) AS VARCHAR(2)) || ', ' || CAST(EXTRACT(YEAR FROM Hours_Pin_Week.mindate) AS VARCHAR(4)) || ' - ' || CAST(ROUND(Hours_Pin_Week.sumhoursweek,2) AS VARCHAR(10)))AS Workweek
FROM Time_Entry, REF_Day_of_Week, Project, Notes,
	(SELECT  Time_Entry.work_date,
		SUM(Time_Entry.Hours) AS sumhours,
		Time_Entry.user_account_id
	FROM Time_Entry
	WHERE Time_Entry.active_ind=1
		AND user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
		AND (CURRENT_TIMESTAMP-Time_Entry.work_date) <= 60
	GROUP BY  Time_Entry.work_date, Time_Entry.user_account_id)
AS hours_pin_date,
	(SELECT EXTRACT(YEAR FROM Time_Entry.work_date) AS year,
		EXTRACT(WEEK FROM Time_Entry.work_date) AS week,
		SUM(Time_Entry.hours) AS sumhoursweek, MIN(Time_Entry.work_date) AS mindate
	FROM Time_Entry
	WHERE Time_Entry.active_ind=1
		AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	GROUP BY EXTRACT(YEAR FROM Time_Entry.work_date), EXTRACT(WEEK FROM Time_Entry.work_date))
AS hours_pin_week
WHERE Time_Entry.active_ind=1
	AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	AND (CURRENT_TIMESTAMP-Time_Entry.work_date) <= 60
	AND Time_Entry.user_account_id=hours_pin_date.user_account_id
	AND Time_Entry.work_date = hours_pin_date.date
	AND DATEPART (DW, Time_Entry.work_date) = REF_Day_Of_Week.day_of_week_id
	AND Time_Entry.project_id = Project.project_id
	AND DATEPART (yyyy, Time_Entry.work_date) = Hours_Pin_Week.year
	AND DATEPART (wk, Time_Entry.work_date) = Hours_Pin_Week.week
	AND Time_Entry.notes_id = Notes.notes_id
	AND Notes.active_ind=1
ORDER BY Time_Entry.work_date desc, project.project_code
</cfquery>
</cfsilent>

