
<!--common_files/act_file_detach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I allow the user to associate a file path with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfquery name="delete_link_task_file" datasource="#application.datasources.main#">
UPDATE Link_Task_File
SET active_ind=0
WHERE active_ind=1
	AND l_t_f_id IN (#attributes.l_t_f_id#)
</cfquery>
<div class="alert alert-success">
	<strong>That worked!</strong>
	You have removed files from <cfoutput><a href="javascript:task_details(#attributes.task_id#);">task #attributes.task_id#</a>.</cfoutput>
</div>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_details" field_name="task_id" fuseaction="Timekeeping.task_details">