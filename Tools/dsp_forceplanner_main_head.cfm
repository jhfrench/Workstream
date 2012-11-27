
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
<thead>
	<tr>
		<th>Task ID</th>
		<th>Task Name</th>
		<th>Project</th>
		<th>Due Date</th>
		<th>Assign<br />Task</th>
		<th>Billable</th>
		#variables.forceplanner_subordinates#
		<th>Requested<br />Hours</th>
		<th>Assigned<br />Hours</th>
		<th>Remaining<br />Hours</th>
	</tr>
</thead>
</cfoutput>