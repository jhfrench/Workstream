
<!--Timekeeping/dsp_associated_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the row that lists any tasks attached to the viewed base task. I also display the buttons that call the ability to attach or de-attach other tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> due_date: date that the task is due
	--> status: string indicating the progress of the task
	--> task_id: number that uniquely identifies a task
	--> task_name: string that gives the name of the task
 --->
</cfsilent>
<h5>Linked tasks</h5>
<cfif comparenocase(listlast(attributes.fuseaction, '.'),"new_task") AND get_associated_tasks.recordcount>
<table class="table table-striped table-bordered">
	<thead>
		<tr>
			<th><abbr title="task id">ID</abbr></th>
			<th>Task name</th>
			<th>Status</th>
			<th>Due date</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_associated_tasks">
		<tr>
			<th scope="row">#task_id#</td>
			<td>
				<a href="javascript:list_to_task('#task_id#');" title="View task."><img src="#request.dir_level##application.application_specific_settings.image_dir##task_icon#" alt="<cfif sort_order EQ 1>#name# is a sub task to the task you are viewing (task #attributes.task_id#).<cfelse>The task you are viewing (task #attributes.task_id#) is a sub task to #name#</cfif>" style="height:10px; width:9px;" height="10" width="9" border="0" />&nbsp;#name#</a>
			</td>
			<td>#status#</td>
			<td class="date">#dateformat(due_date,"m/d/yyyy")#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
<cfelse>
	<p class="alert">No tasks currently associated with this task.</p>
</cfif>
<cfoutput>
<input type="hidden" name="linked_task_id" value="0">
<div class="btn-group">
	<a href="index.cfm?fuseaction=common_files.task_attach&base_task_id=#attributes.task_id#" target="utility" title="Associate another task to this task." class="btn btn-mini"><i class="icon-magnet"></i> Attach</a>
	<a href="index.cfm?fuseaction=common_files.task_detach&task_id=#attributes.task_id#" target="utility" title="Remove a task association from this task." class="btn btn-mini"><i class="icon-remove-sign"></i> Remove</a>
</div>
</cfoutput>