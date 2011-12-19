
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

