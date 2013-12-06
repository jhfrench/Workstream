
<!--Tools/qry_get_daily_email_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I get a list of emails that need to be sent today to people for tasks that have changed status
	||
	Name: Jeromy F
	 ||

 --->
<cfquery name="get_daily_email_list" datasource="#application.datasources.main#">
SELECT Task.task_id, Task.description, Task.name AS task_name,
	Task.due_date, Task.notification_frequency_id, MAX(date_sent),
	CASE Notification.notification_type
		WHEN 14 THEN Owner.email
		ELSE QA.email
	END AS email_from,
	CASE Notification.notification_type
		WHEN 15 THEN QA.email
		ELSE Owner.email
	END AS email_to,
	CASE Notification.notification_type
		WHEN 14 THEN Owner.email_id
		ELSE QA.email_id
	END AS email_id,
	CASE Task.notification_frequency_id
		WHEN 2 THEN MAX(date_sent)+'1 day'
		WHEN 3 THEN MAX(date_sent)+'7 day'
		WHEN 4 THEN MAX(date_sent)+'14 day'
		WHEN 5 THEN MAX(date_sent)+'1 month'
	END AS next_notification
FROM Task
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
	INNER JOIN (
		SELECT email, email_id, task_id
		FROM Email, Team
		WHERE Email.user_account_id=Team.user_account_id
			AND Team.active_ind=1
			AND Team.role_id=1 /* owner */
			AND Email.email_type_id=1
	) AS Owner ON Task.task_id=Owner.task_id
	INNER JOIN (
		SELECT email, email_id, task_id
		FROM Email, Team
		WHERE Email.user_account_id=Team.user_account_id
			AND Team.active_ind=1
			AND Team.role_id=3 /* QA */
			AND Email.email_type_id=1
	) AS QA ON Task.task_id=QA.task_id
	LEFT OUTER JOIN Notification ON Task.task_id=Notification.task_id
		AND Notification.active_ind=1
		AND Notification.notification_type IN (7,14,15)
WHERE Task.notification_frequency_id!=1<!--- $issue$: commenting until this process is activated and I can figure out what task statii are elligibile
	AND Link_Task_Task_Status.task_status_id IN (4,5) --->
GROUP BY Task.task_id, CAST(Task.description AS VARCHAR(255)), Task.name,
	Task.due_date, Task.notification_frequency_id, Owner.email,
	Notification.notification_type, QA.email
HAVING
	CASE Task.notification_frequency_id
		WHEN 2 THEN MAX(date_sent)+'1 day'
		WHEN 3 THEN MAX(date_sent)+'7 day'
		WHEN 4 THEN MAX(date_sent)+'14 day'
		WHEN 5 THEN MAX(date_sent)+'1 month'
	END < CURRENT_TIMESTAMP
</cfquery>
</cfsilent>

