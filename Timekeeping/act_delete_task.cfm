
<!--Timekeeping/act_delete_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I delete all records pertaining to a particular task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="delete_task" datasource="#application.datasources.main#">
UPDATE Task
SET active_ind=0,
	deleted_date=CURRENT_TIMESTAMP,
	deleted_by=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
WHERE active_ind=1
	AND task_id IN (<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" list="true" />)
</cfquery>
</cfsilent>
<cfmodule template="../common_files/act_redirect_browser.cfm" delay="2000" display="Your task has been deleted.<br />You are now being redirected to your task list.">