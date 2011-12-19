
<!--Tools/dsp_forceplanner_main_head.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the column headers at the top of the ForcePlanner tool.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that determines what size the user wants text
	--> variables.emp_init_loop: list of employee initials
 --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">Engagement</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">Task Name</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">Task ID</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">Due Date</td>
		<td align="center" valign="bottom" class="SubHeadText#session.workstream_text_size#">Assign<br>Task</td>
		<td align="center" valign="bottom" class="SubHeadText#session.workstream_text_size#">Billable</td>
	<cfloop list="#variables.emp_init_loop#" index="ii">
		<td align="center" valign="bottom" class="SubHeadText#session.workstream_text_size#">#ii#</td>
	</cfloop>
		<td align="center" bgcolor="##5F5F5F" valign="bottom" class="SubHeadText#session.workstream_text_size#White">Requested<br>Hours</td>
		<td align="center" bgcolor="##5F5F5F" valign="bottom" class="SubHeadText#session.workstream_text_size#White">Assigned<br>Hours</td>
		<td align="center" bgcolor="##5F5F5F" valign="bottom" class="SubHeadText#session.workstream_text_size#White">Remaining<br>Hours</td>
	</tr>
</cfoutput>

