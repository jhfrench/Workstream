
<!--Timekeeping/qry_reassign_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:27:08  stetzer
	<>

	Revision 1.1  2002-12-27 17:50:39-05  french
	Fixed this problem: When reassigning time from one task to another, the Time_Entry.project_id is not inheriting the project_id from the new task; it is keeping the old project_id.

	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted from the express timekeeping page
 --->
<cfquery name="get_project_id" datasource="#application.datasources.main#">
SELECT project_id AS project_id
FROM Task
WHERE task_id=#attributes.reassign_task_id#
</cfquery>
<cfquery name="reassign_hours" datasource="#application.datasources.main#">
UPDATE Time_Entry
SET task_id=#attributes.reassign_task_id#, project_id=#get_project_id.project_id#
WHERE emp_id IN (#attributes.reassign_hours#)
	AND task_id=#attributes.task_id#
	AND date > '#express_check_date.date_locked#'
UPDATE Notes
SET task_id=#attributes.reassign_task_id#
WHERE emp_id IN (#attributes.reassign_hours#)
	AND task_id=#attributes.task_id#
	AND date > '#express_check_date.date_locked#'
</cfquery>
</cfsilent>

