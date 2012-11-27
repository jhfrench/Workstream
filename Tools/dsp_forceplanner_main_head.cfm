
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
<div class="row-fluid">
	<div class="span4">
		<div class="row-fluid">
			<div class="span2">Task ID</div>
			<div class="span2">Task Name</div>
			<div class="span2">Project</div>
			<div class="span2">Due</div>
			<div class="span2">Assign Task</div>
			<div class="span2">Billable</div>
		</div>
	</div>
	<div class="span4">
		#variables.forceplanner_subordinates#
	</div>
	<div class="span4">
		<div class="row-fluid">
			<div class="span4">Requested Hours</div>
			<div class="span4">Assigned Hours</div>
			<div class="span4">Remaining Hours</div>
		</div>
	</div>
</div>
</cfoutput>