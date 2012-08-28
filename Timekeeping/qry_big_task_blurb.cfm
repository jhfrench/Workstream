
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
	--> variables.user_identification: number that uniquely identifies the user
 --->
<cfquery name="big_task_blurb" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.hours) AS project_hours, Time_Entry.project_id, Project.description AS project_name
FROM Time_Entry, Project
WHERE Time_Entry.active_ind=1
	AND Time_Entry.emp_id=#variables.user_identification#
	AND EXTRACT(MONTH FROM Time_Entry.work_date) = EXTRACT(MONTH FROM CURRENT_DATE)
	AND EXTRACT(YEAR FROM Time_Entry.work_date) = EXTRACT(YEAR FROM CURRENT_DATE)
	AND Project.project_id=Time_Entry.project_id
GROUP BY Time_Entry.project_id, Project.description
ORDER BY project_hours DESC
LIMIT 1
</cfquery>
</cfsilent>
