
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
<div class="row-fluid">
	<div class="span6">
			<label class="h5" for="">Project</label>
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
				HTMLBetween="</div>
	<div class='span6'>
			<label class='h5' for='reassign_task_id'>Task</label>">

	</div>
</div>
<div>
	<input type="hidden" name="task_id" value="#attributes.task_id#">
	<cfif isdefined("attributes.user_account_id")><input type="hidden" name="user_account_id" value="#attributes.user_account_id#"></cfif>
	<input type="submit" value="Reassign" class="btn btn-primary" />
	<input type="Reset" class="btn" />
</div>
</cfoutput>