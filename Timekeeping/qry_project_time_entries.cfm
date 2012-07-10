
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
	(CAST(ROUND(Time_Entry.hours,2) AS varchar(25)) + ' - ' +LEFT(Project.project_code,22)+ ' ('+LEFT(Project.description,22)+') ' +' - '+CAST(notes.note AS varchar(70))) AS clientname_data,
	(CAST(REF_Day_Of_Week.day_name AS varchar(9)) +', ' +CAST(DatePart(month,Time_Entry.date) AS varchar(2))+ '/'+CAST(DatePart(day,Time_Entry.date) AS varchar(11))+'/'+CAST (CAST(right(DatePart(year,Time_Entry.date),2) AS varchar(11)) AS varchar(11))+'- '+CAST(hours_pin_date.sumhours AS varchar(11))) AS Workdays, 
	('Week Beginning ' + CAST(DateName(month,Hours_Pin_Week.mindate) AS varchar(9)) + '  ' + CAST(DatePart(day,Hours_Pin_Week.mindate) AS varchar(2)) + ',  ' + CAST(DatePart(year,Hours_Pin_Week.mindate) AS varchar(4)) + '  -  ' + CAST(ROUND(Hours_Pin_Week.sumhoursweek,2) AS varchar(10)))AS Workweek
FROM Time_Entry, REF_Day_of_Week, Project, Notes,
	(SELECT  Time_Entry.date, 
		SUM(Time_Entry.Hours) AS sumhours, 
		Time_Entry.emp_id
	FROM Time_Entry 
	WHERE emp_id = #session.user_account_id# AND DATEDIFF(day, Time_Entry.date, CURRENT_TIMESTAMP) <= 60
	GROUP BY  Time_Entry.date, Time_Entry.emp_id)
AS hours_pin_date,
	(SELECT DATEPART(yyyy, Time_Entry.date) AS year, 
		DATEPART(ww, Time_Entry.date) AS week, 
		SUM(Time_Entry.hours) AS sumhoursweek, MIN(Time_Entry.date) AS mindate
	FROM Time_Entry
	WHERE Time_Entry.emp_id = #session.user_account_id#
	GROUP BY DATEPART(yyyy, Time_Entry.date), DATEPART(ww, Time_Entry.date))
AS hours_pin_week
WHERE Time_Entry.emp_id = #session.user_account_id# AND DATEDIFF(day, Time_Entry.date, CURRENT_TIMESTAMP) <= 60
	AND Time_Entry.emp_id = hours_pin_date.emp_id
	AND Time_Entry.date = hours_pin_date.date
	AND DATEPART (DW, Time_Entry.date) = REF_Day_Of_Week.Day_Num
	AND Time_Entry.project_id = Project.project_id
	AND DATEPART (yyyy, Time_Entry.date) = Hours_Pin_Week.year
	AND DATEPART (wk, Time_Entry.date) = Hours_Pin_Week.week
	AND Time_Entry.Notes_ID = Notes.Notes_ID
ORDER BY Time_Entry.date desc, project.project_code
</cfquery>
</cfsilent>

