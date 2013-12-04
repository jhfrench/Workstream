
<!--Timekeeping/pag_task_details.cfm
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
<cfparam name="attributes.expand" default="0">
</cfsilent>
<cfif isdefined("attributes.last_loaded") AND session.workstream_last_loaded NEQ attributes.last_loaded>
	<cfif isdefined("attributes.file_path")>
		<cfinclude template="act_change_task_details.cfm">
	</cfif>
	<cfif isdefined("attributes.hours") AND (len(attributes.hours) OR len(attributes.notes))>
		<cfinclude template="act_upload_entries.cfm">
	</cfif>
</cfif>
<cfif isdefined("attributes.to_inbox")>
	<cfmodule template="../common_files/act_redirect_browser.cfm" fuseaction="Timekeeping.task_list" display="You are being redirected to your task list.">
<cfelse>
	<cfinclude template="../common_files/act_call_big_team_list.cfm">
	<cfinclude template="qry_get_task_details.cfm">
	<cfif get_task_details.recordcount>
		<cfset attributes.project_id=get_task_details.project_id>
	</cfif>
	<cfinclude template="../common_files/act_call_big_project_list.cfm">
	<cfinclude template="../common_files/qry_get_priorities.cfm">
	<cfinclude template="../common_files/qry_get_ref_icon.cfm"><!---
	<cfinclude template="qry_get_notification_frequency.cfm"> --->
	<cfinclude template="../common_files/qry_get_ref_task_status.cfm">

	<cfif get_task_details.recordcount>
		<cfset attributes.active_only=1>
		<cfinclude template="qry_get_task_team.cfm">
		<cfinclude template="../common_files/qry_get_ref_notes_type.cfm">
		<cfinclude template="qry_get_prep_email.cfm">
		<cfinclude template="qry_get_completion_email.cfm">
		<cfinclude template="qry_get_completion_days.cfm"><!---
		<cfinclude template="qry_get_status_notification_frequency.cfm"> --->
		<cfinclude template="qry_get_completion_cc_email.cfm">
		<cfinclude template="../common_files/qry_get_associated_files.cfm">
		<cfinclude template="../common_files/qry_get_associated_tasks.cfm">
		<cfinclude template="qry_get_time_entry_details.cfm">
		<cfinclude template="../common_files/qry_get_date_locked.cfm">
		<cfset task_owner=get_task_details.owner_id>
		<cfset variables.task_team=valuelist(get_task_Team.user_account_id)>
		<cfset task_qa=get_task_details.qa_id>
		<cfinclude template="../common_files/qry_get_user_fields.cfm">
		<cfinclude template="qry_get_editing_privileges.cfm">
		<cfif get_editing_privileges.recordcount>
			<cfset variables.edit_status="">
		<cfelse>
			<cfset variables.edit_status=' disabled="disabled"'>
		</cfif>
		<cfoutput>
		<form name="task_details_form" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="form">
			<h2>#get_task_details.task_name# <small>(task #attributes.task_id#)</small></h2>
			<cfinclude template="dsp_task_details.cfm">
		</form>
		</cfoutput>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="delete_task" field_name="task_id" fuseaction="Timekeeping.delete_task">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_time" field_name="task_id" fuseaction="Timekeeping.time_details">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_entry_edit" field_name="time_entry_id" fuseaction="Timekeeping.time_entry_edit" process_form_ind="1" given_referer="#attributes.fuseaction#">
		<cfif NOT get_task_details.task_read_ind>
			<cfinclude template="qry_update_task_read.cfm">
		</cfif>
	<cfelse>
		<cfinclude template="dsp_no_task_details.cfm">
	</cfif>
</cfif>
