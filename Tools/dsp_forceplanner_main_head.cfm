
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
<cfset variables.row_count=0>
</cfsilent>
<cfoutput>
<thead>
	<tr>
		<th class="head_task_id">Task <abbr title="Identifier">ID</abbr></th>
		<th class="head_task_name">Task Name</th>
		<th class="head_task_priority">Priority</th>
		<th class="head_task_assign">Assign Task</th>
		<th class="head_task_due">Due</th>
		#variables.forceplanner_subordinates#
		<th class="requested_hours" title="Requested hours">Requested</th>
		<th class="assigned_hours" title="Assigned hours">Assigned</th>
		<th class="remaining_hours" title="Remaining hours">Remaining</th>
	</tr>
</thead>
</cfoutput>