
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
<h5>Linked Tasks</h5>
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
			<td scope="row" class="number">#task_id#</td>
			<td>
				<a href="javascript:list_to_task('#task_id#');" title="View task."><i class="#task_icon#" title="<cfif sort_order EQ 1>#name# is a sub task to the task you are viewing (task #attributes.task_id#).<cfelse>The task you are viewing (task #attributes.task_id#) is a sub task to #name#</cfif>"></i>&nbsp;#name#</a>
			</td>
			<td>#status#</td>
			<td class="date">#dateformat(due_date, "mm/dd/yyyy")#</td><!--- $issue$: change dateformat filters to use application-scoped variable? --->
		</tr>
	</cfoutput>
	</tbody>
</table>
<cfelse>
	<p class="text-warning">No tasks currently linked to this task.</p>
</cfif>
<cfoutput>
<input type="hidden" name="linked_task_id" value="0" />
<div class="btn-group">
	<a id="task_attach" data-toggle="modal" href="index.cfm?base_task_id=#attributes.task_id#&fuseaction=common_files.task_attach" data-target="##utility" title="Associate another task to this task." class="btn"><i class="icon-magnet"></i> Attach</a>
	<a id="task_detach" data-toggle="modal" href="index.cfm?base_task_id=#attributes.task_id#&fuseaction=common_files.task_detach" data-target="##utility" title="Remove a task association from this task." class="btn"><i class="icon-remove-sign"></i> Remove</a>
</div>
</cfoutput>