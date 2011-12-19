
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> due_date: date that the task is due
	--> status: string indicating the progress of the task
	--> task_id: number that uniquely identifies a task
	--> task_name: string that gives the name of the task
 --->
</cfsilent>
			Linked tasks
		<cfif compare(listlast(attributes.fuseaction, '.'),"new_task") AND get_associated_tasks.recordcount>
		<table border="0" cellpadding="1" cellspacing="1">
			<cfoutput>
			<tr>
				<td class="RegText#session.workstream_text_size#Bd">Due date</td>
				<td class="RegText#session.workstream_text_size#Bd"></td>
				<td class="RegText#session.workstream_text_size#Bd">Task name</td>
				<td class="RegText#session.workstream_text_size#Bd">Status</td>
			</tr>
			</cfoutput>
			<cfoutput query="get_associated_tasks">
			<tr>
				<td class="RegText#session.workstream_text_size#">#dateformat(due_date,"mm/dd/yy")#</td>
				<td class="RegText#session.workstream_text_size#">
					<img src="#request.dir_level##application.application_specific_settings.image_dir##task_icon#" alt="<cfif description EQ 1>#name# is a sub task to the task you are viewing (task #attributes.task_id#).<cfelse>The task you are viewing (task #attributes.task_id#) is a sub task to #name#</cfif>" height="10" width="9" border="0">
				</td>
				<td class="RegText#session.workstream_text_size#">
					<a href="javascript:list_to_task('#task_id#');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText#session.workstream_text_size#">#name#</a>
				</td>
				<td class="RegText#session.workstream_text_size#">#status#</td>
			</tr>
			</cfoutput>
		</table>
		<cfelse>
			<br><span class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">No tasks currently associated with this task.</span><br>
		</cfif>
			<cfoutput>
			<input type="hidden" name="linked_task_id" value="0">
			<img src="#request.dir_level##application.application_specific_settings.image_dir#file_attach.gif" valign="bottom" width="60" height="20" alt="Associate another task to this task." border="0"  onclick="window.open('../common_files/index.cfm?fuseaction=task_attach&base_task_id=#attributes.task_id#', 'files', 'toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1,copyhistory=1,width=620,height=450');" tabindex="#incrementvalue(tabindex)#">
			<img src="#request.dir_level##application.application_specific_settings.image_dir#file_detach.gif" valign="bottom" width="60" height="20" alt="Remove a task association from this task." border="0"  onclick="javascript:window.open('../common_files/index.cfm?fuseaction=task_detach&task_id=#attributes.task_id#', 'files', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,copyhistory=0,width=420,height=210');" tabindex="#incrementvalue(tabindex)#">
			</cfoutput>

