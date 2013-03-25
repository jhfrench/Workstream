
<!--Timekeeping/dsp_no_new_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the page that allows the user to specify task details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfif isdefined("attributes.last_loaded")>
<cfquery name="get_created_task" datasource="#application.datasources.main#">
SELECT COALESCE(Task.task_id,0) AS task_id
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1
		AND Team.user_account_id=#attributes.task_owner#
WHERE Task.name='#attributes.task_name#'
	AND Task.due_date='#attributes.due_date#'
	AND Task.icon_id=#attributes.icon_id#
	AND Task.created_by=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
</cfquery>
<div class="alert alert-warning">
<cfoutput>
<cfif get_created_task.recordcount>
	This form has probably already been submitted (task #get_created_task.task_id#); please ensure that you are not entering the same task twice.
<cfelseif NOT compare(attributes.last_loaded,session.workstream_last_loaded)>
	The new task was not created (#attributes.last_loaded# = #session.workstream_last_loaded#).
</cfif>
</cfoutput>
</div>
</cfif>