
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> due_date: date that the task is due
	--> status: string indicating the progress of the task
	--> task_id: number that uniquely identifies a task
	--> task_name: string that gives the name of the task
 --->
<form action="" method="post">
<cfoutput>
	<tr>
		<td colspan="2" class="SelectText#session.workstream_text_size#">
			Mark the tasks you wish to unbind from the task.
		</td>
	</tr>
	<tr>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Delete Task
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Name
		</td>
	</tr>
</cfoutput>
	<cfoutput query="get_associated_tasks">
	<tr>
		<td align="center">
			<input type="Checkbox" name="del_task" value="#task_link_id#" class="RegText#session.workstream_text_size#">	
		</td>
		<td class="RegText#session.workstream_text_size#">
			<img src="#request.dir_level##application.application_specific_settings.image_dir##task_icon#" alt="<cfif description EQ 1>#name# is a sub task to the task you are viewing (task #attributes.task_id#).<cfelse>The task you are viewing (task #attributes.task_id#) is a sub task to #name#</cfif>" height="10" width="9" border="0">&nbsp;#name#
		</td>	
	</tr>
	</cfoutput>
<cfoutput>
	<tr>
		<td align="center" colspan="2">
 			<input type="submit" value="Unbind" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>
</form>

