
<!--Timekeeping/act_send_notification.cfm
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
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: number that uniquely identifies a task
 --->
<cfswitch expression="#attributes.note_type#">
	<cfcase value="completed">
		<cfset variables.email_subject_prefix="Completed workstream Task">
		<cfset variables.notification_text="has been marked complete">
		<cfset variables.sender_type=3>
		<cfset variables.receiver_type="1,5">
	</cfcase>
	<cfcase value="needs_work">
		<cfset variables.email_subject_prefix="workstream Task Needs Work">
		<cfset variables.notification_text="has failed QA">
		<cfset variables.sender_type=3>
		<cfset variables.receiver_type=1>
	</cfcase>
	<cfcase value="new_task">
		<cfset variables.email_subject_prefix="New workstream Task">
		<cfset variables.notification_text="has been created">
		<cfset variables.sender_type=5>
		<cfset variables.receiver_type=1>
	</cfcase>
	<cfcase value="new_owner">
		<cfset variables.email_subject_prefix="Reassigned workstream Task">
		<cfset variables.notification_text="has been assigned to you">
		<cfset variables.sender_type=5>
		<cfset variables.receiver_type=1>
	</cfcase>
	<cfcase value="qa_ready">
		<cfset variables.email_subject_prefix="Please QA workstream Task">
		<cfset variables.notification_text="is ready for QA">
		<cfset variables.sender_type=1>
		<cfset variables.receiver_type=3>
	</cfcase>

	<!--- Needs QA Review in Sandbox--->
	<cfcase value="qa_review_sandbox_ready">
		<cfset variables.email_subject_prefix="Please QA workstream Task in Sandbox">
		<cfset variables.notification_text="is ready for QA in Sandbox">
		<cfset variables.sender_type=1>
		<cfset variables.receiver_type=3>
	</cfcase>

	<!--- Failed QA Review in Test--->
	<cfcase value="qa_review_test_failed">
		<cfset variables.email_subject_prefix="workstream Task Failed QA in Test">
		<cfset variables.notification_text="has Failed QA in Test">
		<cfset variables.sender_type=3>
		<cfset variables.receiver_type=1>
	</cfcase>

	<!--- Failed QA Review in Sandbox--->
	<cfcase value="qa_review_sandbox_failed">
		<cfset variables.email_subject_prefix="workstream Task Failed QA in Sandbox">
		<cfset variables.notification_text="has Failed QA in Sandbox">
		<cfset variables.sender_type=3>
		<cfset variables.receiver_type=1>
	</cfcase>

	<!--- Passed QA Review in Test--->
	<cfcase value="qa_review_test_passed">
		<cfset variables.email_subject_prefix="workstream Task Passed QA in Test">
		<cfset variables.notification_text="has Passed QA in Test">
		<cfset variables.sender_type=3>
		<cfset variables.receiver_type=1>
	</cfcase>

	<!--- Passed QA Review in Sandbox--->
	<cfcase value="qa_review_sandbox_passed">
		<cfset variables.email_subject_prefix="Passed QA in Sandbox workstream Task">
		<cfset variables.notification_text="has Passed QA in Sandbox">
		<cfset variables.sender_type=3>
		<cfset variables.receiver_type=1>
	</cfcase>

	<!--- Ready to Implement in Test--->
	<cfcase value="implement_ready_test">
		<cfset variables.email_subject_prefix="workstream Task Ready to Implement in Test">
		<cfset variables.notification_text="is ready to Implement in Test">
		<cfset variables.sender_type=5>
		<cfset variables.receiver_type=1>
	</cfcase>

	<!--- Ready to Implement in Sandbox--->
	<cfcase value="implement_ready_sandbox">
		<cfset variables.email_subject_prefix="Ready to Implement in Sandbox workstream Task">
		<cfset variables.notification_text="is ready to Implement in Sandbox">
		<cfset variables.sender_type=5>
		<cfset variables.receiver_type=1>
	</cfcase>

	<!--- Ready to Implement in Production--->
	<cfcase value="implement_ready_production">
		<cfset variables.email_subject_prefix="Ready to Implement in Prod workstream Task">
		<cfset variables.notification_text="is ready to Implement in Production">
		<cfset variables.sender_type=5>
		<cfset variables.receiver_type=1>
	</cfcase>

	<cfdefaultcase>
		<cfset variables.notification_text="has been created">
		<cfset variables.sender_type=5>
		<cfset variables.receiver_type=1>
	</cfdefaultcase>
</cfswitch>
</cfsilent>
<cfquery name="prepare_email" datasource="#application.datasources.main#">
SELECT Email_Source.task_source AS email_from, Email.email AS email_to, 
	Task.task_id, Task.name AS task_name, Task.description AS description, 
	Task.budgeted_hours AS budgeted_hours, Task.due_date AS date_due, Emp_Contact.name AS name, Email.email_id
FROM Task, Team, Email, Emp_Contact,
	(SELECT Email.email AS task_source, Team.task_id AS task_id
	FROM Team, Email
	WHERE Team.emp_id=Email.emp_id
		AND Team.task_id=#attributes.task_id#
		AND Team.role_id IN (#variables.sender_type#)
		AND Email.email_type_id=1) AS Email_Source
WHERE Task.task_id=Team.task_id
	AND Team.emp_id=Email.emp_id
	AND Team.emp_id=Emp_Contact.emp_id
	AND Task.task_id=Email_Source.task_id
	AND Team.task_id=#attributes.task_id#
	AND Team.role_id IN (#variables.receiver_type#)
	AND Email.email_type_id=1
	AND Email.emp_id!=#session.user_account_id#
</cfquery>
<cfif prepare_email.recordcount>
	<cfset variables.email_to=valuelist(prepare_email.email_to)>
	<cfset variables.email_from=prepare_email.email_from>

	<cfif listlen(variables.email_to) AND len(variables.email_from)>
		<cfset variables.email_subject="#variables.email_subject_prefix#: #prepare_email.task_name#">
		<cfset variables.email_body="#prepare_email.name#,

The following task #variables.notification_text#: #prepare_email.task_name# (#attributes.task_id#)
Due: #prepare_email.date_due#
Description: #prepare_email.description#

<a href='http://#cgi.http_host#/index.cfm?fuseaction=Timekeeping.task_details&task_id=#attributes.task_id#'>View task #attributes.task_id#</a>">

		<cfmodule template="../common_files/act_email.cfm" email_to="#variables.email_to#" email_from="#variables.email_from#" email_subject="#variables.email_subject#" email_body="#variables.email_body#" email_type="HTML">

		<cfif NOT comparenocase(attributes.note_type, "qa_ready")>
			<cfquery name="update_task_notification_cc" datasource="#application.datasources.main#">
			INSERT INTO Notification (task_id, email_id, notification_type,
				date_sent, date_to_send)
			VALUES (#attributes.task_id#, #prepare_email.email_id#, 7,
				CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
			</cfquery>
		</cfif>
	</cfif>
</cfif>


