
<!--Timekeeping/qry_get_open_tasks.cfm
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
Revision 1.1  2005/03/09 18:24:21  stetzer
<>

Revision 1.1  2001-10-11 10:54:46-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_open_tasks" datasource="#application.datasources.main#">
SELECT Task.name AS task_name, Task.task_id AS task_id
FROM Task, Project_Visible_To 
WHERE Task.project_id = Project_Visible_To.project_id
	AND Task.status_id != 11
	AND Project_Visible_To.company_id IN (#session.workstream_company_select_list#)
ORDER BY Task.name
</cfquery>
</cfsilent>

