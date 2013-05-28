
<!--Timekeeping/qry_get_express_time_entries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the express entry tree view of the user's last 60 days of time entries..
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfquery name="get_express_time_entries" datasource="#application.datasources.main#">
SELECT Time_Entry.time_entry_id, Hours_Pin_Week.sumhoursweek, Hours_Pin_Week.week,
	Hours_Pin_Week.year,
	(CAST(ROUND(Time_Entry.hours,2) AS VARCHAR(25)) || '-' || LEFT(Project.project_code,22) || '(' || LEFT(Project.description,22) || ') ' || ' - ' || CAST(notes.note AS VARCHAR(70))) AS clientname_data,
	(CAST(REF_Day_Of_Week.day_name AS VARCHAR(9)) || ', ' || CAST(EXTRACT(MONTH FROM Time_Entry.work_date) AS VARCHAR(2)) || '/' || CAST(EXTRACT(DAY FROM Time_Entry.work_date) AS VARCHAR(11)) || '/' || RIGHT(CAST(EXTRACT(YEAR FROM Time_Entry.work_date) AS VARCHAR(4)), 2) || '- ' || CAST(Hours_Pin_Date.sumhours AS VARCHAR(11))) AS workdays,
	('Week Beginning ' || CAST(EXTRACT(MONTH FROM Hours_Pin_Week.mindate) AS VARCHAR(9)) || ' ' || CAST(EXTRACT(DAY FROM Hours_Pin_Week.mindate) AS VARCHAR(2)) || ', ' || CAST(EXTRACT(YEAR FROM Hours_Pin_Week.mindate) AS VARCHAR(4)) || ' - ' || CAST(ROUND(Hours_Pin_Week.sumhoursweek,2) AS VARCHAR(10))) AS workweek
FROM Time_Entry
	INNER JOIN REF_Day_of_Week ON EXTRACT (DOW FROM Time_Entry.work_date)=REF_Day_Of_Week.day_of_week_id
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
		AND Notes.active_ind=1
	INNER JOIN (
		SELECT Time_Entry.work_date, Time_Entry.user_account_id, SUM(Time_Entry.Hours) AS sumhours
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
			AND Time_Entry.work_date >= CURRENT_DATE-60 /*within the past 60 days*/
		GROUP BY Time_Entry.work_date, Time_Entry.user_account_id
	) AS Hours_Pin_Date ON Time_Entry.user_account_id=Hours_Pin_Date.user_account_id
		AND Time_Entry.work_date=Hours_Pin_Date.work_date
	INNER JOIN (
		SELECT EXTRACT(YEAR FROM Time_Entry.work_date) AS year, EXTRACT(WEEK FROM Time_Entry.work_date) AS week, SUM(Time_Entry.hours) AS sumhoursweek,
			MIN(Time_Entry.work_date) AS mindate
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
		GROUP BY EXTRACT(YEAR FROM Time_Entry.work_date), EXTRACT(WEEK FROM Time_Entry.work_date)
	) AS Hours_Pin_Week ON EXTRACT(YEAR FROM Time_Entry.work_date)=Hours_Pin_Week.year
		AND EXTRACT(WEEK FROM Time_Entry.work_date)=Hours_Pin_Week.week
WHERE Time_Entry.active_ind=1
	AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	AND Time_Entry.work_date >= CURRENT_DATE-60 /*within the past 60 days*/
ORDER BY Time_Entry.work_date DESC, Notes.created_date DESC, Project.project_code
</cfquery>
</cfsilent>
