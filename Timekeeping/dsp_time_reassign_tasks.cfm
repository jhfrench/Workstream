
<!--Timekeeping/dsp_time_reassign_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
</cfsilent>
<cfoutput>
	<tr valign="middle">
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td class="RegText">
			Project
		</td>
		<td>
			&nbsp;&nbsp;
		</td>
		<td class="RegText">
			Task
		</td>
	</tr>
	<tr valign="middle" class="RegText">
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
				HTMLBetween="</td><td align='center' class='RegText'>&gt;&gt;&gt;</td><td>">
			<input type="hidden" name="task_id" value="#attributes.task_id#">
			<cfif isdefined("attributes.emp_id")><input type="hidden" name="emp_id" value="#attributes.emp_id#"></cfif>
		</td>
	</tr>
</cfoutput>

