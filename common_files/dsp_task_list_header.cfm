
<!--common_files/dsp_task_list_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the column labels for the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 	--> variables.task_list_order: list of query columns to ORDER BY
 --->
</cfsilent>
<thead>
	<tr>
		<th>
			<a href="javascript:order_by('task_id');" title="Order by the task ID.">Task <abbr title="Identifier">ID</abbr><cfif NOT compare(variables.task_list_order_column,"task_id")> <i class="icon-chevron-<cfif variables.task_list_order_down_ind>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th class="hidden-phone">
			<a href="javascript:order_by('task_owner_full_name');" title="Order by the task owner.">Owner<cfif NOT compare(variables.task_list_order_column,"task_owner_full_name")> <i class="icon-chevron-<cfif variables.task_list_order_down_ind>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('task_name');" title="Order by the name of the task.">Task<cfif NOT compare(variables.task_list_order_column,"task_name")> <i class="icon-chevron-<cfif variables.task_list_order_down_ind>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th class="hidden-phone">
			<a href="javascript:order_by('project_name');" title="Order by the task project.">Project<cfif NOT compare(variables.task_list_order_column,"project_name")> <i class="icon-chevron-<cfif variables.task_list_order_down_ind>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th class="hidden-phone">
			<a href="javascript:order_by('REF_Priority.sort_order');" title="Order by Priority.">Priority<cfif NOT compare(variables.task_list_order_column,"REF_Priority.sort_order")> <i class="icon-chevron-<cfif variables.task_list_order_down_ind>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th class="hidden-phone">
			<a href="javascript:order_by('used_hours');" title="Order by the task time.">Time<cfif NOT compare(variables.task_list_order_column,"used_hours")> <i class="icon-chevron-<cfif variables.task_list_order_down_ind>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('REF_Status.sort_order');" title="Order by the task status.">Status<cfif NOT compare(variables.task_list_order_column,"task_status")> <i class="icon-chevron-<cfif variables.task_list_order_down_ind>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
		<th>
			<a href="javascript:order_by('due_date');" title="Order by the date that the task is due.">Due<cfif NOT compare(variables.task_list_order_column,"due_date")> <i class="icon-chevron-<cfif variables.task_list_order_down_ind>down<cfelse>up</cfif>"></i></cfif></a>
		</th>
	</tr>
</thead>