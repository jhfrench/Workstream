
<!--common_files/dsp_task_detach_form.cfm
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
	--> due_date: date that the task is due
	--> status: string indicating the progress of the task
	--> task_id: number that uniquely identifies a task
	--> task_name: string that gives the name of the task
 --->
</cfsilent>
<form action="" method="post">
<cfoutput>
	<tr>
		<td colspan="2" class="SelectText">
			Mark the tasks you wish to unbind from the task.
		</td>
	</tr>
	<tr>
		<td align="center" class="SubHeadText">
			Delete Task
		</td>
		<td class="SubHeadText">
			Name
		</td>
	</tr>
</cfoutput>
	<cfoutput query="get_associated_tasks">
	<tr>
		<td align="center">
			<input type="checkbox" name="del_task" value="#l_t_t_id#">
		</td>
		<td>
			<img src="#request.dir_level##application.application_specific_settings.image_dir##task_icon#" alt="<cfif sort_order EQ 1>#name# is a sub task to the task you are viewing (task #attributes.task_id#).<cfelse>The task you are viewing (task #attributes.task_id#) is a sub task to #name#</cfif>" height="10" width="9" border="0">&nbsp;#name#
		</td>
	</tr>
	</cfoutput>
<cfoutput>
	<tr>
		<td align="center" colspan="2">
 			<input type="submit" value="Unbind">
		</td>
	</tr>
</cfoutput>
</form>

