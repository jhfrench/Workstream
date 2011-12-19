
<!--Timekeeping/dsp_time_reassign_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project/engagement list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.2  2006/08/11 11:00:38  french
Making time reassign work with two-related-selects.

Revision 1.1  2005-03-09 13:22:28-05  stetzer
<>

Revision 1.1  2001-10-11 10:54:59-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<cfoutput>
	<tr valign="middle">
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td class="RegText#session.workstream_text_size#">
			Project
		</td>
		<td>
			&nbsp;&nbsp;
		</td>
		<td class="RegText#session.workstream_text_size#">
			Task
		</td>
	</tr>
	<tr valign="middle" class="RegText#session.workstream_text_size#">
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td>
			<cfmodule template="../common_files/two_related_selects.cfm"
				query="get_open_tasks"
				name1="project_id"
				name2="reassign_task_id"
				display1="project_display"
				display2="task_display"
				value1="project_id"
				value2="task_id"
				multiple1="0"
				multiple2="0"
				size1="6"
				size2="6"
				width2="600"
				autoselectfirst="no"
				formname="time_details"
				HTMLBetween="</td><td align='center' class='RegText#session.workstream_text_size#'>&gt;&gt;&gt;</td><td>">
			<input type="hidden" name="task_id" value="#attributes.task_id#">
			<cfif isdefined("attributes.emp_id")><input type="hidden" name="emp_id" value="#attributes.emp_id#"></cfif>
		</td>
	</tr>
</cfoutput>

