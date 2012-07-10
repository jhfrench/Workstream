
<!--Timekeeping/qry_big_task_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the hours an employee worked in the last two months.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> session.user_account_id: number that uniquely identifies the user
 --->
<cfquery name="big_task_blurb" datasource="#application.datasources.main#">
SELECT TOP 1 SUM(Time_Entry.hours) AS project_hours, Time_Entry.project_id, Project.description AS project_name
FROM Time_Entry, Project
WHERE Time_Entry.emp_id=#session.user_account_id#
	AND EXTRACT(MONTH FROM Time_Entry.date) = EXTRACT(MONTH FROM CURRENT_TIMESTAMP)
	AND EXTRACT(YEAR FROM Time_Entry.date) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP)
	AND Project.project_id=Time_Entry.project_id
GROUP BY Time_Entry.project_id, Project.description
ORDER BY project_hours DESC
</cfquery>
</cfsilent>
