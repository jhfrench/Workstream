
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
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
<cfif isdefined("attributes.last_loaded")>
<cfquery name="get_created_task" datasource="#application.datasources.main#">
SELECT ISNULL(Task.task_id,0) AS task_id
FROM Task, Team
WHERE Task.task_id=Team.Task_ID
	AND Team.Roll_ID=1
	AND Team.emp_id=#attributes.task_owner#
	AND Task.name='#attributes.task_name#'
	AND Task.due_date='#attributes.due_date#'
	AND Task.icon_id=#attributes.icon_id#
	AND Task.creator=#session.user_account_id#
</cfquery>
<cfif get_created_task.recordcount>
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="This form has probably already been submitted (task #get_created_task.task_id#); please ensure that you are not entering the same task twice." align="center" section_color="ffffff" colspan="2" gutter="0" title_class="Note#session.workstream_text_size#">
<cfelseif NOT compare(attributes.last_loaded,session.workstream_last_loaded)>
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="The new task was not created (#attributes.last_loaded# = #session.workstream_last_loaded#)." align="center" section_color="ffffff" colspan="2" gutter="0" title_class="Note#session.workstream_text_size#">
</cfif>
</cfif>
</table><br>

