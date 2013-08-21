
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
SELECT Day_Level_Dates.date_year, Day_Level_Dates.date_month, Day_Level_Dates.date_week,
	NULL AS day_of_week_number, MIN(Day_Level_Dates.odbc_date) AS work_date,
	0 AS time_entry_id, COALESCE(SUM(Time_Entry.hours),0) AS hours, NULL AS project_code,
	NULL AS project_description, NULL AS note, CAST(NULL AS TIMESTAMP) AS created_date,
	1 AS sort_order
FROM (
		SELECT date_year, date_month, date_week, day_of_week_number, odbc_date
		FROM REF_Date
		WHERE odbc_date BETWEEN CURRENT_DATE-60 AND CURRENT_DATE+14 /*within the past 60 days*/
	) Day_Level_Dates
	LEFT OUTER JOIN Time_Entry ON Day_Level_Dates.odbc_date=Time_Entry.work_date
		AND Time_Entry.active_ind=1
		AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
		AND Time_Entry.work_date BETWEEN CURRENT_DATE-60 AND CURRENT_DATE+14 /*within the past 60 days*/
GROUP BY Day_Level_Dates.date_year, Day_Level_Dates.date_month, Day_Level_Dates.date_week
UNION ALL
SELECT Day_Level_Dates.date_year, Day_Level_Dates.date_month, Day_Level_Dates.date_week,
	Day_Level_Dates.day_of_week_number, Day_Level_Dates.odbc_date AS work_date,
	0 AS time_entry_id, COALESCE(SUM(Time_Entry.hours),0) AS hours, NULL AS project_code,
	NULL AS project_description, NULL AS note, NULL AS created_date,
	2 AS sort_order
FROM (
		SELECT date_year, date_month, date_week, day_of_week_number, odbc_date
		FROM REF_Date
		WHERE odbc_date BETWEEN CURRENT_DATE-60 AND CURRENT_DATE+14 /*within the past 60 days*/
	) Day_Level_Dates
	LEFT OUTER JOIN Time_Entry ON Day_Level_Dates.odbc_date=Time_Entry.work_date
		AND Time_Entry.active_ind=1
		AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
		AND Time_Entry.work_date BETWEEN CURRENT_DATE-60 AND CURRENT_DATE+14 /*within the past 60 days*/
GROUP BY Day_Level_Dates.date_year, Day_Level_Dates.date_month, Day_Level_Dates.date_week,
	Day_Level_Dates.day_of_week_number, Day_Level_Dates.odbc_date
UNION ALL
SELECT NULL AS date_year, NULL AS date_month, NULL AS date_week,
	NULL AS day_of_week_number, Time_Entry.work_date,
	Time_Entry.time_entry_id, Time_Entry.hours, Project.project_code,
	Project.description, SUBSTR(Notes.note, 0, 140) AS note, Notes.created_date,
	3 AS sort_order
FROM Time_Entry
	LEFT OUTER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
		AND Notes.active_ind=1
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
		AND Project.active_ind=1
WHERE Time_Entry.active_ind=1
	AND Time_Entry.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	AND Time_Entry.work_date BETWEEN CURRENT_DATE-60 AND CURRENT_DATE+14 /*within the past 60 days*/
ORDER BY work_date, sort_order, created_date
</cfquery>
</cfsilent>
