
<!--Timekeeping/dsp_task_details_table.cfm
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

<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset variables.cols=114>
	</cfcase>
	<cfcase value="Md">
		<cfset variables.cols=117>
	</cfcase>
	<cfdefaultcase>
		<cfset variables.cols=120>
	</cfdefaultcase>
</cfswitch>
<cfset variables.descrip_rows=min(3,(len(get_task_details.description)/variables.cols+1))>
<cfset variables.resolution_rows=min(8,time_entry_details.recordcount)>
<cfset entry_rows=variables.descrip_rows+variables.resolution_rows-9>
<cfset variables.string_to_replace='<P>,"'>

<cfset variables.width=min(numberformat(get_task_details.image_width,"______"),variables.var1)>
<cfset variables.width2=variables.var1-variables.width>

<cfif get_task_details.qa_id EQ session.user_account_id AND get_task_details.status_id EQ 4>
	<cfset variables.notes_type_selected=2>
<cfelseif get_task_details.owner_id EQ session.user_account_id>
	<cfset variables.notes_type_selected=1>
<cfelseif get_task_details.task_read_ind>
	<cfset variables.notes_type_selected=3>
<cfelse>
	<cfset variables.notes_type_selected=0>
</cfif>

<!--- $issue$ THIS SHOULD GO INTO A REF TABLE SOME DAY --->
<cfset variables.valid_files="cfm,doc,gif,htm,jpg,msg,pdf,ppt,sql,vsd,xls,zip">
</cfsilent>
<cfoutput>
	<input type="hidden" name="task_id" value="#task_id#" />
	<input type="hidden" name="project_id" value="#get_task_details.project_id#" />
	<input type="hidden" name="last_loaded" value="#now()#" />
	<input type="hidden" name="orig_owner" value="#task_owner#" />
	<input type="hidden" name="orig_team" value="#task_team#" />
	<input type="hidden" name="orig_qa" value="#task_qa#" />
	<input type="hidden" name="orig_due_date" value="#dateformat(get_task_details.due_date,"mm/dd/yy")#" />
	<input type="hidden" name="orig_priority_id" value="#get_task_details.priority#" />
	<input type="hidden" name="orig_project_id" value="#get_task_details.project_id#" />
	<input type="hidden" name="orig_task_status_id" value="#get_task_details.status_id#" />
	<input type="hidden" name="orig_icon_id" value="#get_task_details.icon_id#" />
	<input type="hidden" name="orig_task_description" value="#ReplaceList(ParagraphFormat(get_task_details.description),variables.string_to_replace,",")#" />
	<input type="hidden" name="orig_reminder_days" value="#get_completion_days.reminder_days#" />
	<input type="hidden" name="orig_reminder_cc" value="#valuelist(get_prep_email.email_id)#" />
	<input type="hidden" name="orig_notification" value="#valuelist(get_completion_email.email_id)#" />
	<input type="hidden" name="orig_notification_cc" value="#valuelist(get_completion_cc_email.email_id)#" />
	<input type="hidden" name="orig_file" value="#get_task_details.status_id#" />
<div class="row-fluid">
	<div class="span6">
		<label for="task_name" class="h5">Task name</label>
		<input type="text" name="task_name" id="task_name" value="#htmleditformat(get_task_details.task_name)#"  valign="top" size="#variables.cols#" maxlength="255" class="span11" />
		<p><span class="h5">Customer</span>: #get_task_details.customer_name# <span class="h5">Project</span>: #replace(get_task_details.project_name,"#get_task_details.customer_name#-","")#&nbsp;<img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" width="14" height="12" alt="See more projects." border="0" onclick="OpenProjectWindow('project_id');"></p>
		<label for="task_name" class="h5">Description</label>
		<textarea name="task_details" id="task_details" cols="#variables.cols-2#" rows="#variables.descrip_rows#" wrap="soft" class="span11">#replaceList(ParagraphFormat(get_task_details.description),'<P>,"',",")#</textarea>
		<div class="row-fluid">
			<div class="span4">
				<label for="task_owner" class="h5">Owner</label>
				<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_owner" emp_id="#task_owner#" class="span11">
				<label for="task_team" class="h5">Team</label>
				<cfmodule template="../common_files/dsp_team_select.cfm" multi="1" size="4" select_name="task_team" emp_id="#task_team#" class="span11">
				<label for="task_qa" class="h5"><abbr title="Quality Assurance Tester">QA</abbr></label>
				<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_qa" emp_id="#task_qa#" class="span11">
				<label for="task_source" class="h5">Source</label>
				<span id="task_source">#get_task_details.source_name#</span>
			</div>
			<div class="span4">
				<label for="date_assigned" class="h5">Date assigned</label>
				<span id="date_assigned" class="span11 date">#dateformat(get_task_details.date_assigned,"mm/dd/yy")#</span>
				<label for="due_date" class="h5">Date due</label>
				<input type="date" name="due_date" id="due_date" min="2011-09-01" value="#dateformat(get_task_details.due_date,'yyyy-mm-dd')#" maxlength="10" required="required" class="span11 date" />
				<div style="float:left;">
				<label for="date_completed" class="h5">Date completed</label>
				<span id="date_completed" class="span11 date"><cfif len(get_task_details.complete_date) AND get_task_details.status_id EQ 11>#dateformat(get_task_details.complete_date,"mm/dd/yy")#<cfelse>Not yet completed</cfif></span>
				</div>
			</div>
			<div class="span4">
				<label for="priority_id" class="h5">Priority</label>
				<cfselect name="priority_id" id="priority_id" query="get_priorities" display="description" value="priority_id" selected="#get_task_details.priority#" class="span11"></cfselect>
				<label for="icon_id" class="h5">Icon</label>
				<cfselect query="get_ref_icon" name="icon_id" id="icon_id" display="icon_name" value="icon_id" selected="#get_task_details.icon_id#" class="span11" />
				<label for="task_status" class="h5">Status</label>
				<cfselect query="get_task_stati" name="task_status" display="status" value="status_id" selected="#get_task_details.status_id#" class="span11">
				</cfselect>
			</div>
		</div>
	</div>
	<div class="span6">
			<div class="row-fluid">
				<div class="span12">
				<label for="notes" class="h5">Progress notes</label>
				<cfif time_entry_details.recordcount>
					<div id="notes" style="height:#variables.resolution_rows*40#px;" class="faux-textarea span12">
						<cfloop query="time_entry_details"><p<cfif notes_type_id EQ 2> class="alert-info"</cfif>><strong>(#initials# #dateformat(date,"m/d/yy")#)</strong> - #trim(note)#&nbsp;&nbsp;</p></cfloop>
					</div>
				<cfelse>
					<div id="notes" class="alert">
						Resolution notes not yet entered for this task.&nbsp;
						<a href="javascript:delete_check('#attributes.task_id#');"  title="Delete this task from workstream." class="btn btn-danger"><i class="icon-trash icon-white"></i> Delete this task</a>
					</div>
				</cfif>
				</div>
			</div>
		<cfinclude template="dsp_task_detail_notes_entry.cfm">
		<cfif listfind("1,5", session.workstream_emp_contact_type) OR session.workstream_show_hours_data_ind EQ 1>
			<!--- show time data to employees or customers if their company is set up to view hours--->
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