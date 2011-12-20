
<!--Timekeeping/dsp_print_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task. If a task is not specified I display the form to set task details/create a new task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> customer_name: string that identifies the customer for whom the task is created
	--> project_name: string that contains the name of the project the task is assigned to
 --->
</cfsilent>
<cfoutput>
		<td align="right" valign="top" class="SubHeadText">
			 <a href="javascript:printable('#attributes.task_id#');" title="'View a printable version of this task." class="Note"><img src="#request.dir_level##application.application_specific_settings.image_dir#document.gif" width="16" height="16" alt="View a printable version of this task." border="0">Printable task sheet</a>
		</td>
</cfoutput>

