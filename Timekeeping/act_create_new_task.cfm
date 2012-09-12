
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
<cfparam name="attributes.task_team" default=0>
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

<cfquery name="update_associated_file" datasource="#application.datasources.main#">
UPDATE Link_Task_File
SET task_id=#attributes.task_id#
WHERE task_id=0
	AND created_by=#variables.user_identification#
</cfquery>

<cfif compare(attributes.linked_task_id,0)>
	<cfset attributes.base_task_id=attributes.task_id>
	<cfinclude template="../common_files/qry_task_attach.cfm">
</cfif>

