
<!--Timekeeping/act_send_reminders.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I send reminder emails
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: number that uniquely identifies a task
 --->
<cfquery name="pre_due_email" datasource="#application.datasources.main#">
SELECT Task.task_id, Task.name AS task_name, Task.description AS description, 
	Task.budgeted_hours, Task.due_date, 
	Task_Source.task_source AS email_from, Email.email AS email_to, 
	Demographics.first_name, Notification.days_before_due AS countdown
FROM Task
	INNER JOIN Notification ON Task.task_id=Notification.task_id
		AND Notification.notification_type=1
		AND Notification.date_to_send<=CURRENT_TIMESTAMP
		AND Notification.date_sent IS NULL
	INNER JOIN Email ON Notification.email_id=Email.email_id
		AND Email.email_type_id=1
	INNER JOIN Demographics ON Email.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN (
		SELECT Email.email AS task_source, Email.user_account_id AS source_id, Team.task_id
		FROM Team
			INNER JOIN Email ON Team.user_account_id=Email.user_account_id
		WHERE Team.active_ind=1
			AND Team.role_id=5
			AND Email.email_type_id=1
	) AS Task_Source ON Task.task_id=Task_Source.task_id
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
		AND Link_Task_Task_Status.task_status_id!=7 /*exclude closed tasks*/
WHERE Task.active_ind=1
</cfquery>
<cfloop query="pre_due_email">
<cfquery name="get_cc" datasource="#application.datasources.main#">
SELECT Email.email AS email_to
FROM Task
	INNER JOIN Notification ON Task.task_id=Notification.task_id
		AND Notification.notification_type=2
	INNER JOIN Email ON Notification.email_id=Email.email_id
		AND Email.email_type_id=1
	INNER JOIN Demographics ON Email.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN (
		SELECT Email.email AS task_source, Email.user_account_id AS source_id, Team.task_id
		FROM Team
			INNER JOIN Email ON Team.user_account_id=Email.user_account_id
		WHERE Team.active_ind=1
			AND Team.role_id=5
			AND Email.email_type_id=1
	) AS Task_Source ON Task.task_id=Task_Source.task_id
WHERE Task.task_id=#task_id#
</cfquery>
<cfset variables.cc_list=valuelist(get_cc.email_to)>
<!--- $issue$: need to give recipient of this message an "out" so they can stop receiving these notifications --->
<cfmail from="#application.application_specific_settings.system_email_sender#" to="#email_to#" cc="#variables.cc_list#" subject="workstream Task Reminder: #task_name#" type="HTML"
	server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
	port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
<cfmailparam name="Reply-To" value="#email_from#">
#first_name#,
The following task will be due in #datediff("d",now(),dateadd("d",1,due_date))# day<cfif countdown NEQ 1>s</cfif>: 
Task name: #task_name# (http://#cgi.server_name#/index.cfm?fuseaction=Timekeeping.task_details&task_id=#task_id#)
Task Number: #task_id#
Due: #dateformat(due_date,"mmm d, yyyy")#
Description
-----------
#description#


</cfmail>
<cfquery name="update_notification" datasource="#application.datasources.main#">
UPDATE notification
SET date_sent=CURRENT_TIMESTAMP
WHERE task_id=#task_id#
</cfquery>
</cfloop>
</cfsilent>