
<!--Timekeeping/qry_express_time_entries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the .
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
 <!--- $issue$: is this template still needed? --->
<cfquery name="express_time_entries" datasource="#application.datasources.main#">
SELECT Time_Entry.time_entry_id AS ID, Hours_Pin_Week.sumhoursweek,
	Hours_Pin_Week.week, Hours_Pin_Week.year, 
	(CAST(ROUND(Time_Entry.hours,2) AS varchar(25)) || '-' || LEFT(Project.project_code,22) || '(' || LEFT(Project.description,22) || ') ' || ' - ' || CAST(notes.note AS varchar(70))) AS clientname_data,
	(CAST(REF_Day_Of_Week.day_name AS varchar(9)) || ', ' || CAST(EXTRACT(MONTH FROM Time_Entry.work_date) AS varchar(2)) || '/' || CAST(DatePart(day,Time_Entry.work_date) AS varchar(11)) || '/' || CAST (CAST(right(EXTRACT(YEAR FROM Time_Entry.work_date),2) AS varchar(11)) AS varchar(11)) || '- ' || CAST(hours_pin_date.sumhours AS varchar(11))) AS Workdays, 
	('Week Beginning ' || CAST(DateName(month,Hours_Pin_Week.mindate) AS varchar(9)) || ' ' || CAST(DatePart(day,Hours_Pin_Week.mindate) AS varchar(2)) || ', ' || CAST(EXTRACT(YEAR FROM Hours_Pin_Week.mindate) AS varchar(4)) || ' - ' || CAST(ROUND(Hours_Pin_Week.sumhoursweek,2) AS varchar(10)))AS Workweek
FROM Time_Entry, REF_Day_of_Week, Project, Notes,
	(SELECT  Time_Entry.work_date, 
		SUM(Time_Entry.Hours) AS sumhours, 
		Time_Entry.emp_id
	FROM Time_Entry 
	WHERE Time_Entry.active_ind=1
		AND emp_id=#session.user_account_id#
		AND (CURRENT_TIMESTAMP-Time_Entry.work_date) <= 60
	GROUP BY  Time_Entry.work_date, Time_Entry.emp_id)
AS hours_pin_date,
	(SELECT EXTRACT(YEAR FROM Time_Entry.work_date) AS year, 
		DATEPART(ww, Time_Entry.work_date) AS week, 
		SUM(Time_Entry.hours) AS sumhoursweek, MIN(Time_Entry.work_date) AS mindate
	FROM Time_Entry
	WHERE Time_Entry.active_ind=1
		AND Time_Entry.emp_id = #session.user_account_id#
	GROUP BY EXTRACT(YEAR FROM Time_Entry.work_date), DATEPART(ww, Time_Entry.work_date))
AS hours_pin_week
WHERE Time_Entry.active_ind=1
	AND Time_Entry.emp_id = #session.user_account_id# AND (CURRENT_TIMESTAMP-Time_Entry.work_date) <= 60
	AND Time_Entry.emp_id = hours_pin_date.emp_id
	AND Time_Entry.work_date = hours_pin_date.date
	AND DATEPART (DW, Time_Entry.work_date) = REF_Day_Of_Week.Day_Num
	AND Time_Entry.project_id = Project.project_id
	AND DATEPART (yyyy, Time_Entry.work_date) = Hours_Pin_Week.year
	AND DATEPART (wk, Time_Entry.work_date) = Hours_Pin_Week.week
	AND Time_Entry.notes_id = Notes.notes_id
	AND Notes.active_ind=1
ORDER BY Time_Entry.work_date desc, project.project_code
</cfquery>
</cfsilent>

