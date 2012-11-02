
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
<cfparam name="attributes.notification_cc_id" default="">
<cfparam name="attributes.notification_to_id" default="">
<cfparam name="attributes.reminder_cc_id" default="">
<cfparam name="attributes.status_notification_frequency" default="">
<cfparam name="attributes.task_qa" default="">
<cfparam name="attributes.task_team" default=0>
</cfsilent>

<!---TASK DETAILS CAN BE EDITED BY THIS PERSON (task owner, supervisor of task owner, task source, or task creator)--->
<cfif compare(attributes.task_details,attributes.orig_task_description)>
	<cfinclude template="qry_update_task_description.cfm">
</cfif>
<cfif compare(attributes.due_date,attributes.orig_due_date)>
	<cfinclude template="qry_update_task_due_date.cfm">
</cfif>
<cfif compare(attributes.priority_id,attributes.orig_priority_id)>
	<cfinclude template="qry_update_task_priority.cfm">
</cfif>
<cfif comparenocase(attributes.project_id,"undefined") AND attributes.project_id NEQ attributes.orig_project_id>
	<cfinclude template="qry_update_task_project_id.cfm">
</cfif><!--- 
<cfinclude template="qry_update_notification_frequency.cfm"> --->

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
	<cfinclude template="qry_update_task_name.cfm">
<cfif compare(attributes.task_status,attributes.orig_task_status_id)>
	<cfinclude template="qry_update_task_status.cfm">
	<cfswitch expression="#attributes.task_status#">
		<cfcase value="3">
			<cfmodule template="act_send_notification.cfm" note_type="qa_ready" task_id="#attributes.task_id#">
		</cfcase>
		<cfcase value="4">
			<cfmodule template="act_send_notification.cfm" note_type="needs_work" task_id="#attributes.task_id#">
		</cfcase>
		<cfcase value="7">
			<cfmodule template="act_send_notification.cfm" note_type="completed" task_id="#attributes.task_id#">
		</cfcase>
		<cfcase value="8">
			<cfmodule template="act_send_notification.cfm" note_type="qa_review_sandbox_ready" task_id="#attributes.task_id#">
		</cfcase>

		<cfcase value="5">
			<cfmodule template="act_send_notification.cfm" note_type="qa_review_test_failed" task_id="#attributes.task_id#">
		</cfcase>

		<cfcase value="19">
			<cfmodule template="act_send_notification.cfm" note_type="qa_review_test_passed" task_id="#attributes.task_id#">
		</cfcase>

		<cfcase value="20">
			<cfmodule template="act_send_notification.cfm" note_type="qa_review_sandbox_passed" task_id="#attributes.task_id#">
		</cfcase>

		<cfcase value="21">
			<cfmodule template="act_send_notification.cfm" note_type="implement_ready_test" task_id="#attributes.task_id#">
		</cfcase>

		<cfcase value="23">
			<cfmodule template="act_send_notification.cfm" note_type="implement_ready_sandbox" task_id="#attributes.task_id#">
		</cfcase>

		<cfcase value="24">
			<cfmodule template="act_send_notification.cfm" note_type="implement_ready_production" task_id="#attributes.task_id#">
		</cfcase>
	</cfswitch>
</cfif>
<cfif compare(attributes.icon_id,attributes.orig_icon_id)>
	<cfinclude template="qry_update_task_icon.cfm">
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