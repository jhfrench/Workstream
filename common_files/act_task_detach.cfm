
<!--common_files/act_task_detach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I delete the table entries that tie a task to another task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfquery name="delete_link_task_task" datasource="#application.datasources.main#">
UPDATE Link_Task_Task
SET active_ind=0
WHERE active_ind=1
	AND l_t_t_id IN (#attributes.l_t_t_id#)
</cfquery>
<div class="alert alert-success">
	<strong>That worked!</strong>
	You have removed tasks from <cfoutput><a href="javascript:task_details(#attributes.base_task_id#);">task #attributes.base_task_id#</a>.</cfoutput>
</div>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_details" field_name="task_id" fuseaction="Timekeeping.task_details">
