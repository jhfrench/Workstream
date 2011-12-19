
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
	Revision 1.1  2005/03/09 18:19:52  stetzer
	<>

	Revision 1.3  2002-02-01 09:57:25-05  french
	Added check to prevent error caused by trying to attach a document then submitting without selecting a document in the pop-up window.

	Revision 1.2  2001-11-13 10:26:11-05  french
	Added the ability to attach tasks.

	Revision 1.1  2001-10-11 10:55:21-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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

