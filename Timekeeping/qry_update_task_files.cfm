
<!--Timekeeping/qry_update_task_files.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the the list of files associated with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:27:42  stetzer
<>

Revision 1.2  2001-10-12 11:48:12-04  french
Reinstated delete function and added condition to where statement. Now when a task is associated to a task, any previous identical entries in the table will be removed. This will keep a user from (uselessly) associating the same file to a task twice.

Revision 1.1  2001-10-11 10:54:36-04  long
Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_files" datasource="#application.datasources.main#">
<cfloop list="#file_paths#" index="ii">
DELETE
FROM Associated_Files
WHERE task_id=#attributes.task_id# AND file_path='#ii#'

INSERT INTO Associated_Files(task_id,file_path)
VALUES (#attributes.task_id#,'#ii#')
</cfloop>
</cfquery>
</cfsilent>

