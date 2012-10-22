
<!--Timekeeping/dsp_task_new_col_left.cfm
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
<div class="row-fluid">
	<div class="span6">
		<label for="task_owner" class="h5">Owner <i class="icon-share" title="See more employees." onclick="OpenTeamWindow('task_owner');"></i></label>
		<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_owner" class="span9">
		<label for="task_team" class="h5">Team</label>
		<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_team" multi="1" size="6" emp_id="0" class="span9">
		<label for="task_qa" class="h5"><abbr title="Quality Analyst">QA</abbr> <i class="icon-share" title="See more employees." onclick="OpenTeamWindow('task_qa');"></i></label>
		<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_qa" class="span9">
		<label for="task_status" class="h5">Status</label>
		<cfselect query="get_task_stati" name="task_status" id="task_status" display="status" value="status_id" selected="1" class="span9"></cfselect>
	</div>
	<div class="span6">
			<label for="date_start" class="h5">Start Date</label>
			<input type="date" name="date_start" id="date_start" min="#application.application_specific_settings.workstream_start_date#" value="#dateformat(now(), 'yyyy-mm-dd')#" maxlength="10" required="required" class="span9 date" />
			<label for="due_date" class="h5">Date Due</label>
			<input type="date" name="due_date" id="due_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span9 date" />
			<label for="priority_id" class="h5">Priority</label>
			<cfselect name="priority_id" id="priority_id" query="get_priorities" display="description" value="priority_id" selected="3" class="span9"></cfselect>
			<label for="icon_id" class="h5">Icon</label>
			<cfselect query="get_ref_icon" name="icon_id" id="icon_id" display="icon_name" value="icon_id" selected="1" class="span9"></cfselect>
			<label for="budgeted_hours" class="h5">Hours Budgeted</label>
			<input type="number" name="budgeted_hours" id="budgeted_hours" step="1" min="0" max="999" class="span9" />
			<!-- let CF create the JavaScript: <cfinput type="text" name="budgeted_hours" id="budgeted_hours" required="yes" validate="float" message="Please enter a number for hours budgeted." class="span6"> -->
	</div>
</div>
<div class="row-fluid">
	<div class="span12">
			<input type="hidden" name="last_loaded" value="#now()#" />
			<input type="hidden" name="to_inbox" value="" />
			<input type="hidden" name="to_edit" value="" />
			<div class="btn-group">
			<input type="button" value="Create New Task" class="btn btn-mini" onclick="checkTheDescription('');" />
			<input type="button" value="Submit To Inbox" class="btn btn-mini btn-primary" onclick="checkTheDescription('to_inbox');" />
			<input type="button" value="Create And Edit" class="btn btn-mini" onclick="checkTheDescription('to_edit');" />
			</div>
	</div>
</div>
</cfoutput>

