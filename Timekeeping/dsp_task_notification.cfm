
<!--Timekeeping/dsp_task_notification.cfm
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
	<cfset variables.to_list=valuelist(get_completion_email.email_id)>
	<cfset variables.cc_list=valuelist(get_completion_cc_email.email_id)>
<cfelse>
	<cfset variables.to_list=0>
	<cfset variables.cc_list=0>
</cfif>
</cfsilent>
<div class="form-horizontal">
	<h4>Completion Notification</h4>
	<div class="control-group">
		<label for="notification_to_id" class="control-label">Recipient List</label>
		<div class="controls">
		<cfmodule template="../common_files/dsp_team_select.cfm" select_name="notification_to_id" emp_id="#variables.to_list#" email_only="1" multi="1" size="4" class="span6">
		</div>
	</div>
	<div class="control-group">
		<label for="notification_cc_id" class="control-label"><abbr title="Carbon-Copy">CC</abbr> List</label>
		<div class="controls">
		<cfmodule template="../common_files/dsp_team_select.cfm" select_name="notification_cc_id" emp_id="#variables.cc_list#" email_only="1" multi="1" size="4" class="span6">
		</div>
	</div>
</div>