
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
<cfloop list="#file_paths#" index="variables.ii">
UPDATE Link_Task_File
SET active_ind=0
WHERE task_id=#attributes.task_id#
	AND file_path='#variables.ii#'

INSERT INTO Link_Task_File (task_id, file_path, created_by)
VALUES (#attributes.task_id#, '#variables.ii#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfloop>
</cfquery>
</cfsilent>

