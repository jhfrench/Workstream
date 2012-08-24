
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
	AND l_t_t_id IN (#attributes.del_task#)
</cfquery>
<div class="alert alert-success">
	<strong>That worked!</strong>
	You have removed tasks from task <cfoutput>#attributes.task_id#</cfoutput>.
</div>

