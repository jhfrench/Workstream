<!--Timekeeping/dsp_task_details_col_left.cfm
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
<cfif listlen(get_task_details.hours_used,".") GT 1 AND listgetat(get_task_details.hours_used,2,".") GT 0>
	<cfset variables.hours_used=decimalformat(get_task_details.hours_used)>
<cfelse>
	<cfset variables.hours_used=numberformat(get_task_details.hours_used)>
</cfif>

<cfset variables.width=min(numberformat(get_task_details.image_width,"______"),variables.var1)>
<cfset variables.width2=variables.var1-variables.width>

<cfif get_task_details.qa_id EQ session.user_account_id AND get_task_details.status_id EQ 4>
	<cfset notes_type_selected=2>
<cfelseif get_task_details.owner_id EQ session.user_account_id>
	<cfset notes_type_selected=1>
<cfelseif get_task_details.task_read>
	<cfset notes_type_selected=3>
<cfelse>
	<cfset notes_type_selected=0>
</cfif>
</cfsilent>
<cfoutput>
<div class="row-fluid">
	<div class="span6">
		<label for="task_owner">Owner</label>
		<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_owner" emp_id="#task_owner#" class="span11">
		<label for="task_team">Team</label>
		<cfmodule template="../common_files/dsp_team_select.cfm" multi="1" size="4" select_name="task_team" emp_id="#task_team#" class="span11">
		<label for="task_qa"><abbr title="Quality Assurance Tester">QA</abbr></label>
		<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_qa" emp_id="#task_qa#" class="span11">
		<label for="task_status">Status</label>
		<cfselect query="get_task_stati" name="task_status" display="status" value="status_id" selected="#get_task_details.status_id#" class="span11">
		</cfselect>
	</div>
	<div class="span6">
		<label for="task_source">Source</label>
		<span id="task_source">#get_task_details.source_name#</span><br />
		<label for="date_assigned">Date Assigned</label>
		<span id="date_assigned">#dateformat(get_task_details.date_assigned,"mm/dd/yy")#</span><br />
		<label for="due_date">Date Due</label>
		<cfinput type="datefield" name="due_date" id="due_date" value="#dateformat(get_task_details.due_date,'mm/dd/yy')#" required="Yes" validate="date" message="Please enter a properly formatted date" size="11" class="span11" />
		<label for="date_completed">Date&nbsp;Completed</label>
		<span id="date_completed"><cfif len(get_task_details.complete_date) AND get_task_details.status_id EQ 11>#dateformat(get_task_details.complete_date,"mm/dd/yy")#<cfelse>Not yet completed</cfif></span><br />
		</cfoutput>
		<label for="priority_id">Priority</label>
		<cfselect name="priority_id" id="priority_id" query="get_priorities" display="description" value="priority_id" selected="#get_task_details.priority#" class="span11"></cfselect>
		<label for="icon_id">Icon</label>
		<cfselect query="get_ref_icon" name="icon_id" id="icon_id" display="icon_name" value="icon_id" selected="#get_task_details.icon_id#" class="span11" />
	</div>
</div>
<div class="row-fluid border-radius(3px)">
	<div class="span12">
	<cfinclude template="dsp_task_detail_notes_entry.cfm">
	</div>
</div>
<cfoutput>
<cfif listfind("1,5", session.workstream_emp_contact_type) OR session.workstream_show_hours_data_ind EQ 1>
	<!--- show time data to employees or customers if their company is set up to view hours--->
	<div class="row-fluid">
		<div class="span12">
			<h4>Time Used</h4>
			<span class="RegText">#variables.hours_used#<cfif get_task_details.budgeted_hours> out of #get_task_details.budgeted_hours# budgeted hours (#decimalformat(get_task_details.percent_used)#%)</cfif></span>
		</div>
	</div>
	<cfif get_task_details.budgeted_hours>
	<div class="row-fluid">
		<div class="span12">
			<div style="height:20px; width:198px; border:1px solid;" title="Time used for '#get_task_details.task_name#': #variables.hours_used# out of #get_task_details.budgeted_hours# hours (#decimalformat(get_task_details.percent_used)#%). Follow link to reassign hours.">
			<cfif width><a href="javascript:list_to_time('#task_id#');"><img src="#request.dir_level##application.application_specific_settings.image_dir#bar_<cfif get_task_details.percent_used GT 75>1<cfelseif get_task_details.percent_used GT 50>3<cfelse>7</cfif>.gif" style="width:#variables.width#px; height:20px;" alt="Percent of time used." border="0" /></a></cfif><cfif width2><img src="#request.dir_level##application.application_specific_settings.image_dir#blank.gif" style="width:#variables.width2#px; height:20px;" alt="Percent of time left." border="0" /></cfif>
			</div>
		</div>
	</div>
	</cfif>
<cfelse>
	<div class="row-fluid">
		<div class="span12">
			<h4>Hours Budgeted</h4>
			<p>#get_task_details.budgeted_hours#</p>
		</div>
	</div>
</cfif>
</cfoutput>