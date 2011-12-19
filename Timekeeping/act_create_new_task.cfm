
<!--Timekeeping/act_create_new_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update a task's details if neceesary.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfparam name="attributes.task_team" default="">
<cfparam name="attributes.reminder_cc_id" default="">
<cfparam name="attributes.notification_to_id" default="">
<cfparam name="attributes.notification_cc_id" default="">
</cfsilent>
	<cfinclude template="qry_insert_new_task.cfm">
	<cfinclude template="qry_update_task_owner.cfm">
	<cfinclude template="qry_update_task_team.cfm">
	<cfinclude template="qry_update_task_qa.cfm">
	<cfinclude template="qry_update_task_reminder_days.cfm">
	<cfinclude template="qry_update_task_reminder_cc.cfm">
	<cfinclude template="qry_update_task_notification.cfm">
	<cfinclude template="qry_update_task_notification_cc.cfm">
<cfif len(attributes.file_path) AND compare(attributes.file_path,0)>
	<cfset file_paths=URLDecode(attributes.file_path)>
	<cfinclude template="qry_update_task_files.cfm">
</cfif>
<cfif compare(attributes.linked_task_id,0)>
	<cfset attributes.base_task_id=attributes.task_id>
	<cfinclude template="../common_files/qry_task_attach.cfm">
</cfif>

