
<!--Timekeeping/act_change_task_details.cfm
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
<cfscript>
	if (NOT isdefined("attributes.notification_cc_id")) {
		attributes.notification_cc_id="";	
	}
	if (NOT isdefined("attributes.notification_to_id")) {
		attributes.notification_to_id="";	
	}
	if (NOT isdefined("attributes.reminder_cc_id")) {
		attributes.reminder_cc_id="";	
	}
	if (NOT isdefined("attributes.status_notification_frequency")) {
		attributes.status_notification_frequency="";	
	}
	if (NOT isdefined("attributes.task_qa")) {
		attributes.task_qa="";	
	}
	if (NOT isdefined("attributes.task_team")) {
		attributes.task_team=0;	
	}
</cfscript>
</cfsilent>

<cfinclude template="qry_get_editing_privileges.cfm">
<cfinclude template="qry_update_task.cfm">
<cfif get_editing_privileges.recordcount>
	<cfif comparenocase(attributes.project_id,"undefined") AND attributes.project_id NEQ attributes.orig_project_id>
		<cfinclude template="qry_update_task_project_id.cfm">
	</cfif>
</cfif>

<cfif compare(attributes.task_owner,attributes.orig_owner)>
	<cfinclude template="qry_update_task_owner.cfm">
	<cfmodule template="act_send_notification.cfm" note_type="new_owner" task_id="#attributes.task_id#">
</cfif>
<cfif compare(listsort(attributes.task_team,"numeric"),listsort(attributes.orig_team,"numeric"))>
	<cfinclude template="qry_update_task_team.cfm">
</cfif>
<cfif compare(attributes.task_qa,attributes.orig_qa)>
	<cfinclude template="qry_update_task_qa.cfm">
</cfif>
<cfif compare(attributes.task_status,attributes.orig_task_status_id)>
	<cfmodule template="act_send_notification.cfm" task_status="#attributes.task_status#" task_id="#attributes.task_id#">
</cfif>

<cfif (compare(attributes.reminder_days,attributes.orig_reminder_days)) OR (compare(attributes.task_owner,attributes.orig_owner))>
<!---If the owner or number of days changes--->
	<cfinclude template="qry_update_task_reminder_days.cfm">
</cfif>
<cfif compare(listsort(attributes.reminder_cc_id,"numeric"),listsort(attributes.orig_reminder_cc,"numeric"))>
	<cfinclude template="qry_update_task_reminder_cc.cfm">
</cfif>
<!---notification that task is completed--->
<cfif compare(listsort(attributes.notification_to_id,"numeric"),listsort(attributes.orig_notification,"numeric"))>
	<cfinclude template="qry_update_task_notification.cfm">
</cfif>
<cfif compare(listsort(attributes.notification_cc_id,"numeric"),listsort(attributes.orig_notification_cc,"numeric"))>
	<cfinclude template="qry_update_task_notification_cc.cfm">
</cfif>

<cfif isdefined("attributes.custom_drops_collection") or isdefined("attributes.custom_text_collection")>
	<cfinclude template="qry_upload_delete_user_answers.cfm">
</cfif>
<cfif isdefined("attributes.custom_drops_collection")>
	<cfinclude template="qry_upload_custom_drops_answers.cfm">
</cfif>
<cfif isdefined("attributes.custom_text_collection")>
	<cfinclude template="qry_upload_custom_text_answers.cfm">
</cfif>