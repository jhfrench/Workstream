
<!--Timekeeping/qry_get_task_owner.cfm
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
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_task_owner" datasource="#application.datasources.main#">
SELECT Team.emp_id AS emp_id
FROM Task, Team
WHERE Task.task_id=Team.task_id
	AND Task.task_id=#attributes.task_id#
	AND Team.roll_id=1
</cfquery>
</cfsilent>

