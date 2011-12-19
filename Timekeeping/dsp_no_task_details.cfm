
<!--Timekeeping/dsp_no_task_details.cfm
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
 --->
</cfsilent>
<cfoutput>
<table align="center" border="0" cellpadding="1" cellspacing="0" width="70%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;No details available" section_color="78A0EB" colspan="2" gutter="0" title_class="HeadText#session.workstream_text_size#">
	<tr>
		<td class="Note#session.workstream_text_size#">
			There is no task to display that corresponds to your inquiry. This may be caused by looking for task details on a reserved project that does not require time entered to the task. Please see your workstream administrator for more information.
		</td>
	</tr>
</table>
</cfoutput>

