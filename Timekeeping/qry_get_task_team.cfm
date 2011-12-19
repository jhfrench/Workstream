
<!--Timekeeping/qry_get_task_team.cfm
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
Revision 1.1  2005/03/09 18:26:28  stetzer
<>

Revision 1.1  2001-10-11 10:54:42-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_task_team" datasource="#application.datasources.main#">
SELECT Team.emp_id AS emp_id
FROM Task, Team
WHERE Task.task_id=Team.task_id
	AND Task.task_id=#attributes.task_id#
	AND Team.roll_id=4
</cfquery>
</cfsilent>

