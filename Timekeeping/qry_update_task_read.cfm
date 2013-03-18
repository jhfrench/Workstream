
<!--Timekeeping/qry_update_task_read.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task to show that the task has been read.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="update_task_read" datasource="#application.datasources.main#">
UPDATE Task
SET task_read_ind=1
WHERE task_read_ind=0
	AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>
