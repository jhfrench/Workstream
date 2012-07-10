
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
SELECT Time_Entry.time_entry_id, Hours_Pin_Week.sumhoursweek,
	Hours_Pin_Week.week, Hours_Pin_Week.year, 
	(CAST(ROUND(Time_Entry.hours,2) AS varchar(25)) || '-' || LEFT(Project.project_code,22) || '(' || LEFT(Project.description,22) || ') ' || ' - ' || CAST(notes.note AS varchar(70))) AS clientname_data,
	(CAST(REF_Day_Of_Week.day_name AS varchar(9)) || ', ' || CAST(DATEPART(month,Time_Entry.date) AS varchar(2)) || '/' || CAST(DATEPART(day,Time_Entry.date) AS varchar(11)) || '/' || CAST (CAST(RIGHT(YEAR(Time_Entry.date),2) AS varchar(11)) AS varchar(11)) || '- ' || CAST(Hours_Pin_Date.sumhours AS varchar(11))) AS workdays, 
	('Week Beginning ' || CAST(DATENAME(month,Hours_Pin_Week.mindate) AS varchar(9)) || ' ' || CAST(DATEPART(day,Hours_Pin_Week.mindate) AS varchar(2)) || ',  ' || CAST(YEAR(Hours_Pin_Week.mindate) AS varchar(4)) || ' - ' || CAST(ROUND(Hours_Pin_Week.sumhoursweek,2) AS varchar(10)))AS workweek
FROM Time_Entry, REF_Day_of_Week, Project, Notes,
	(
		SELECT Time_Entry.date, SUM(Time_Entry.Hours) AS sumhours, Time_Entry.emp_id
		FROM Time_Entry 
		WHERE emp_id=#session.user_account_id#
			AND DATEDIFF(day, Time_Entry.date, CURRENT_TIMESTAMP) <= 60
		GROUP BY  Time_Entry.date, Time_Entry.emp_id
	) AS Hours_Pin_Date,
	(
		SELECT YEAR(Time_Entry.date) AS year, DATEPART(ww, Time_Entry.date) AS week, SUM(Time_Entry.hours) AS sumhoursweek, 
			MIN(Time_Entry.date) AS mindate
		FROM Time_Entry
		WHERE Time_Entry.emp_id=#session.user_account_id#
		GROUP BY YEAR(Time_Entry.date), DATEPART(ww, Time_Entry.date)
	) AS Hours_Pin_Week
WHERE DATEPART(DW, Time_Entry.date)=REF_Day_Of_Week.Day_Num
	AND Time_Entry.project_id=Project.project_id
	AND Time_Entry.notes_id=Notes.notes_id
	AND Time_Entry.emp_id=Hours_Pin_Date.emp_id
	AND Time_Entry.date=Hours_Pin_Date.date
	AND YEAR(Time_Entry.date)=Hours_Pin_Week.year
	AND DATEPART(wk, Time_Entry.date)=Hours_Pin_Week.week
	AND Time_Entry.emp_id=#session.user_account_id#
	AND DATEDIFF(day, Time_Entry.date, CURRENT_TIMESTAMP) <= 60
ORDER BY Time_Entry.date DESC, Notes.created_date DESC, Project.project_code
</cfquery>
</cfsilent>

