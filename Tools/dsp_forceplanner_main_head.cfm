
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
	--> variables.emp_init_loop: list of employee initials
 --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td valign="bottom" class="SubHeadText">Project</td>
		<td valign="bottom" class="SubHeadText">Task Name</td>
		<td valign="bottom" class="SubHeadText">Task ID</td>
		<td valign="bottom" class="SubHeadText">Due Date</td>
		<td align="center" valign="bottom" class="SubHeadText">Assign<br>Task</td>
		<td align="center" valign="bottom" class="SubHeadText">Billable</td>
	<cfloop list="#variables.emp_init_loop#" index="ii">
		<td align="center" valign="bottom" class="SubHeadText">#ii#</td>
	</cfloop>
		<td align="center" bgcolor="##5F5F5F" valign="bottom" class="SubHeadTextWhite">Requested<br>Hours</td>
		<td align="center" bgcolor="##5F5F5F" valign="bottom" class="SubHeadTextWhite">Assigned<br>Hours</td>
		<td align="center" bgcolor="##5F5F5F" valign="bottom" class="SubHeadTextWhite">Remaining<br>Hours</td>
	</tr>
</cfoutput>

