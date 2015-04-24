
<!--Timekeeping/dsp_task_reminder.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the people who are to be notified of a task's completion.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfif comparenocase(listlast(attributes.fuseaction, '.'),"new_task")>
	<cfset variables.reminder_days=get_completion_days.reminder_days>
	<cfset variables.cc_list=valuelist(get_prep_email.email_id)><!---
	<cfset variables.notification_frequency_id=get_task_details.notification_frequency_id> --->
<cfelse>
	<cfset variables.reminder_days="">
	<cfset variables.cc_list="">
	<cfset variables.notification_frequency_id = 1>
</cfif>
</cfsilent>
<cfoutput>
<div class="form-horizontal">
	<h5>Due Date Reminder</h5>
	<div class="control-group">
		<label for="reminder_days" class="h5 control-label">Days</label>
		<div class="controls">
		<input type="number" name="reminder_days" id="reminder_days" value="#variables.reminder_days#" step="1" min="0" max="90" class="span2 number" />
		<span class="help-inline">Please specify your pre due date reminder as a number of whole days before the due date.</span>
		</div>
	</div>
	<div class="control-group">
		<label for="reminder_cc_id" class="h5 control-label"><abbr title="Carbon-Copy">CC</abbr> List</label>
		<div class="controls">
		<cfmodule template="../common_files/dsp_team_select.cfm" select_name="reminder_cc_id" user_account_id="#variables.cc_list#" email_only="1" multi="1" size="4" class="span6">
		</div>
	</div>
	<!--- Status Notification Frequency<br />
	<cfselect name="notification_frequency_id" query="get_notification_frequency" display="description" value="notification_frequency_id" selected="#variables.notification_frequency_id#" size="1" required="yes">
	</cfselect> --->
</cfoutput>
</div>