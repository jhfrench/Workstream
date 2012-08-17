
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
	Task.budgeted_hours AS budgeted_hours, Task.due_date AS date_due, 
	Task_Source.task_source AS email_from, Email.email AS email_to, 
	Emp_Contact.name AS name, Notification.days_before_due AS countdown
FROM Task, Notification, Email, Emp_Contact,
	(SELECT Email.email AS task_source, Email.emp_id AS source_id, Team.task_id AS task_id
	FROM Team, Email
	WHERE Team.emp_id=Email.emp_id
		AND Team.role_id=5
		AND Email.email_type_id=1)
AS Task_Source
WHERE Task.task_id=Task_Source.task_id
	AND Task.task_id=Notification.task_id
	AND Notification.email_id=Email.email_id
	AND Email.emp_id=Emp_Contact.emp_id
	AND Email.email_type_id=1
	AND Task.status_id!=7 /*exclude closed tasks*/
	AND Notification.notification_type=1
	AND Notification.date_to_send<=CURRENT_TIMESTAMP
	AND Notification.date_sent IS NULL
</cfquery>
<cfloop query="pre_due_email">
<cfquery name="get_cc" datasource="#application.datasources.main#">
SELECT Email.email AS email_to
FROM Task, Notification, Email, Emp_Contact,
	(SELECT Email.email AS task_source, Email.emp_id AS source_id, Team.task_id AS task_id
	FROM Team, Email
	WHERE Team.emp_id=Email.emp_id
		AND Team.role_id=5
		AND Email.email_type_id=1)
AS Task_Source
WHERE Task.task_id=Task_Source.task_id
	AND Task.task_id=Notification.task_id
	AND Notification.email_id=Email.email_id
	AND Email.emp_id=Emp_Contact.emp_id
	AND Notification.notification_type=2
	AND Task.task_id=#task_id#
</cfquery>
<cfset variables.cc_list=valuelist(get_cc.email_to)>
<cfmail from="#application.erroremailfrom#" to="#email_to#" cc="#variables.cc_list#" subject="workstream Task Reminder: #task_name#" server="#application.emailserver#">
<cfmailparam name="Reply-To" value="#email_from#">
#name#,
The following task will be due in #datediff("d",now(),dateadd("d",1,date_due))# day<cfif countdown NEQ 1>s</cfif>: 
Task name: #task_name# (http://#cgi.server_name#/index.cfm?fuseaction=Timekeeping.task_details&task_id=#task_id#)
Task Number: #task_id#
Due: #dateformat(date_due,"mmm d, yyyy")#
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

