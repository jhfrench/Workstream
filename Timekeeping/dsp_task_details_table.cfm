
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
</cfsilent>
<cfoutput>
	<input type="hidden" name="task_id" value="#task_id#">
	<input type="hidden" name="project_id" value="#get_task_details.project_id#">
	<input type="hidden" name="last_loaded" value="#now()#">
	<input type="hidden" name="orig_owner" value="#task_owner#">
	<input type="hidden" name="orig_team" value="#task_team#">
	<input type="hidden" name="orig_qa" value="#task_qa#">
	<input type="hidden" name="orig_due_date" value="#dateformat(get_task_details.due_date,"mm/dd/yy")#">
	<input type="hidden" name="orig_priority_id" value="#get_task_details.priority#">
	<input type="hidden" name="orig_task_status_id" value="#get_task_details.status_id#">
	<input type="hidden" name="orig_icon_id" value="#get_task_details.icon_id#">
	<input type="hidden" name="orig_task_description" value="#ReplaceList(ParagraphFormat(get_task_details.description),variables.string_to_replace,",")#">
	<input type="hidden" name="orig_reminder_days" value="#get_completion_days.reminder_days#">
	<input type="hidden" name="orig_reminder_cc" value="#valuelist(get_prep_email.email_id)#">
	<input type="hidden" name="orig_notification" value="#valuelist(get_completion_email.email_id)#">
	<input type="hidden" name="orig_notification_cc" value="#valuelist(get_completion_cc_email.email_id)#">
	<input type="hidden" name="orig_file" value="#get_task_details.status_id#">
</cfoutput>
<div class="row-fluid">
	<div class="span3">
		<cfinclude template="dsp_task_details_col_left.cfm">
	</div>
	<div class="span9">
		<cfinclude template="dsp_task_details_col_right.cfm">
	</div>
</div>
<div class="row-fluid">
	<div class="span6">
		<cfinclude template="dsp_task_reminder.cfm">
	</div>
	<div class="span6">
		<cfinclude template="dsp_task_notification.cfm">
	</div>
</div>
<cfif NOT time_entry_details.recordcount>
	<cfinclude template="dsp_task_delete.cfm">
</cfif>