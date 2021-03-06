
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
<cfmodule template="qry_update_task_assignment.cfm" task_id="#attributes.task_id#" role_id="1" user_account_id="#attributes.task_owner#">
<cfmodule template="qry_update_task_assignment.cfm" task_id="#attributes.task_id#" role_id="4" user_account_id="#attributes.task_team#">
<cfmodule template="qry_update_task_assignment.cfm" task_id="#attributes.task_id#" role_id="3" user_account_id="#attributes.task_qa#">
<cfinclude template="qry_update_task_reminder_days.cfm">
<cfinclude template="qry_update_task_reminder_cc.cfm">
<cfinclude template="qry_update_task_notification.cfm">
<cfinclude template="qry_update_task_notification_cc.cfm">

<cfquery name="update_associated_file" datasource="#application.datasources.main#">
UPDATE Link_Task_File
SET task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
WHERE task_id=0
	AND created_by=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
</cfquery>

<cfif compare(attributes.linked_task_id,0)>
	<cfset attributes.base_task_id=attributes.task_id>
	<cfinclude template="../common_files/qry_insert_link_task_task.cfm">
</cfif>
