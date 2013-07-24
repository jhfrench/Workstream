
<!--Timekeeping/dsp_task_details.cfm
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
<cfscript>
	variables.cols=80;
	variables.descrip_rows=min(3,(len(get_task_details.description)/variables.cols+1));
	variables.resolution_rows=min(8,get_time_entry_details.recordcount);
	variables.entry_rows=variables.descrip_rows+variables.resolution_rows-9;
	variables.string_to_replace='<P>,"';

	if (get_task_details.qa_id EQ variables.user_identification AND get_task_details.task_status_id EQ 3) {
		//task needs QA and the user is the assigned tester
		variables.notes_type_selected=2;
	}
	else if (get_task_details.owner_id EQ variables.user_identification) {
		//task owner
		variables.notes_type_selected=1;
	}
	else {
		variables.notes_type_selected=0;
	}
</cfscript>
</cfsilent>
<cfoutput>
	<cfset variables.task_description=replaceList(paragraphformat(get_task_details.description),'<P>,"',",")>
	<cfset variables.task_name=htmleditformat(get_task_details.task_name)>
	<input type="hidden" name="last_loaded" value="#now()#" />
	<input type="hidden" name="orig_due_date" value="#dateformat(get_task_details.due_date,"m/d/yyyy")#" />
	<input type="hidden" name="orig_file" value="#get_task_details.task_status_id#" />
	<input type="hidden" name="orig_icon_id" value="#get_task_details.icon_id#" />
	<input type="hidden" name="orig_notification" value="#valuelist(get_completion_email.email_id)#" />
	<input type="hidden" name="orig_notification_cc" value="#valuelist(get_completion_cc_email.email_id)#" />
	<input type="hidden" name="orig_owner" value="#task_owner#" />
	<input type="hidden" name="orig_priority_id" value="#get_task_details.priority#" />
	<input type="hidden" name="orig_project_id" value="#get_task_details.project_id#" />
	<input type="hidden" name="orig_qa" value="#task_qa#" />
	<input type="hidden" name="orig_reminder_cc" value="#valuelist(get_prep_email.email_id)#" />
	<input type="hidden" name="orig_reminder_days" value="#get_completion_days.reminder_days#" />
	<input type="hidden" name="orig_task_description" value="#variables.task_description#" />
	<input type="hidden" name="orig_task_name" value="#variables.task_name#" />
	<input type="hidden" name="orig_task_status_id" value="#get_task_details.task_status_id#" />
	<input type="hidden" name="orig_team" value="#variables.task_team#" />
	<input type="hidden" name="project_id" value="#get_task_details.project_id#" />
	<input type="hidden" name="task_id" value="#task_id#" />
<div class="row-fluid">
	<div class="span6">
		<label for="task_name" class="h5">Task Name</label>
		<input type="text" name="task_name" id="task_name" value="#variables.task_name#" valign="top" size="#variables.cols#" maxlength="255"#variables.edit_status# class="span11" />
		<p>
			<span class="h5">Customer</span>: <span id="customer_name">#get_task_details.customer_name#</span>
			<span class="h5">Project</span>: <span id="project_name">#replace(get_task_details.project_name,"#get_task_details.customer_name#-","")#</span>
			<a id="project_change" href="index.cfm?task_id=#attributes.task_id#&fuseaction=common_files.project_list" role="button" data-toggle="modal" data-target="##utility" title="Change this task's project assignment." class="btn btn-mini">
				<i class="icon-share"></i> Change
			</a>
		</p>
		<label for="task_description" class="h5">Description <a href="javascript:$('##task_description').height( $('##task_description').height()*2 );" title="Expand description"><i class="icon-resize-vertical"></i></a></label>
		<textarea name="task_description" id="task_description" cols="#variables.cols-2#" rows="#variables.descrip_rows#" wrap="soft"#variables.edit_status# class="span11">
			#variables.task_description#
		</textarea>
		<div class="row-fluid">
			<div class="span4">
				<label for="task_owner" class="h5">Owner</label>
				<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_owner" user_account_id="#task_owner#" class="span11">
				<label for="task_team" class="h5">Team</label>
				<cfmodule template="../common_files/dsp_team_select.cfm" multi="1" size="4" select_name="task_team" user_account_id="#variables.task_team#" class="span11">
				<label for="task_qa" class="h5"><abbr title="Quality Assurance Tester">QA</abbr></label>
				<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_qa" user_account_id="#task_qa#" class="span11">
				<label for="task_source" class="h5">Source</label>
				<span id="task_source">#get_task_details.source_name#</span>
			</div>
			<div class="span4">
				<label for="date_assigned" class="h5">Date Assigned</label>
				<span id="date_assigned" class="span11 date">#dateformat(get_task_details.date_assigned,"m/d/yyyy")#</span>
				<label for="due_date" class="h5">Date Due</label>
				<input type="date" name="due_date" id="due_date" min="#application.application_specific_settings.workstream_start_date#" value="#dateformat(get_task_details.due_date,'yyyy-mm-dd')#" maxlength="10" required="required"#variables.edit_status# class="span11 date" />
				<span class="h5">Date Completed</span>
				<div id="complete_date" class="span12 date"><cfif get_task_details.task_status_id EQ 11 AND len(get_task_details.complete_date)>#dateformat(get_task_details.complete_date,"m/d/yyyy")#<cfelse>Not yet completed</cfif></div>
			</div>
			<div class="span4">
				<label for="priority_id" class="h5">Priority</label>
				<select name="priority_id" id="priority_id"#variables.edit_status# class="span11">
				<cfloop query="get_priorities">
					<option value="#priority_id#"<cfif priority_id EQ get_task_details.priority> selected="selected"</cfif>>#description#</option>
				</cfloop>
				</select>
				<label for="icon_id" class="h5">Icon</label>
				<select name="icon_id" id="icon_id" class="span11">
				<cfloop query="get_ref_icon">
					<option value="#icon_id#"<cfif icon_id EQ get_task_details.icon_id> selected="selected"</cfif>>#icon_name#</option>
				</cfloop>
				</select>
				<label for="task_status" class="h5">Status</label>
				<select name="task_status" id="task_status" class="span11">
				<cfloop query="get_ref_task_status">
					<option value="#task_status_id#"<cfif task_status_id EQ get_task_details.task_status_id> selected="selected"</cfif>>#description#</option>
				</cfloop>
				</select>
			</div>
		</div>
	</div>
	<div class="span6">
		<div class="row-fluid">
			<div class="span12">
			<label for="notes" class="h5">Progress Notes <a href="javascript:$('##notes').height( $('##notes').height()*2 );" title="Expand progress notes"><i class="icon-resize-vertical"></i></a></label>
			<cfif get_time_entry_details.recordcount>
				<div id="notes" style="height:#variables.resolution_rows*40#px;" class="faux-textarea span12"><cfloop query="get_time_entry_details"><p<cfif notes_type_id EQ 2> class="alert-info"</cfif>><strong>(<abbr title="#author#">#initials#</abbr> #dateformat(work_date,"m/d/yyyy")#)</strong> - #trim(note)# <cfif time_entry_id><a href="javascript:time_entry_edit(#time_entry_id#);" title="edit this note"><i class="icon-edit"></i> Edit</a></cfif></p></cfloop></div>
			<cfelse>
				<div id="notes" class="alert">
					<a href="javascript:delete_check('#attributes.task_id#');" title="Delete this task from workstream." class="btn btn-danger"><i class="icon-trash icon-white"></i> Delete this task</a>
					&nbsp;Resolution notes not yet entered for this task.
				</div>
				<script language="JavaScript">
				var delete_check=function(task_id) {
					if (confirm('Are you sure you wish to delete this task?')) {
						delete_task(task_id);
					};
					return;
				};
				</script>
			</cfif>
			</div>
		</div>
		<cfinclude template="dsp_task_detail_notes_entry.cfm">
		<cfif listfind("1,5", session.account_type_id) OR session.workstream_show_hours_data_ind EQ 1>
			<!--- show time data to employees, or customers *if* their company is set up to view hours--->
			<cfinclude template="dsp_time_details_graph.cfm">
		<cfelse>
			<div class="row-fluid">
				<div class="span12">
					<h5>Hours Budgeted</h5>
					<p>#get_task_details.budgeted_hours#</p>
				</div>
			</div>
		</cfif>
	</div>
</div>
<div class="row-fluid">
	<div class="span6">
		<cfinclude template="dsp_associated_files.cfm">
		<cfinclude template="dsp_associated_tasks.cfm">
	</div>
	<div class="span6">
		<cfinclude template="dsp_task_reminder.cfm">
		<cfinclude template="dsp_task_notification.cfm">
	</div>
</div>
<cfif get_user_fields.recordcount>
<div class="row-fluid">
	<div classs="span12">
		<cfinclude template="dsp_custom_fields.cfm">
	</div>
</div>
</cfif>
</cfoutput>

