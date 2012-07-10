
<!--Tools/qry_get_daily_email_list.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I get a list of emails that need to be sent today to people for tasks that have changed status
	||
	Name: Damon S
	 || 
	
 --->
<cfquery name="get_daily_email_list" datasource="#application.datasources.main#">
SELECT Task.task_id, CAST(Task.description AS varchar(255)) AS description, Task.name AS task_name,
	Task.due_date, Task.notification_frequency_id,
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
	MAX(date_sent),
	CASE Task.notification_frequency_id
		WHEN 2 THEN MAX(date_sent)+'1 day'
		WHEN 3 THEN MAX(date_sent)+'7 day'
		WHEN 4 THEN MAX(date_sent)+'14 day'
		WHEN 5 THEN MAX(date_sent)+'1 month'
		END AS next_notification
FROM Task, Notification,
	(SELECT email, email_id, task_id
	FROM Email, Team
	WHERE Email.emp_id=Team.emp_id
		AND Team.role_id=1
		AND Email.email_type_id=1) AS Owner,
	(SELECT email, email_id, task_id
	FROM Email, Team
	WHERE Email.emp_id=Team.emp_id
		AND Team.role_id=3
		AND Email.email_type_id=1) AS QA
WHERE Task.task_id*=Notification.task_id
	AND Task.task_id=Owner.task_id
	AND Task.task_id=QA.task_id
	AND Notification.notification_type IN (7,14,15)
	AND Task.status_id IN (4,5)
	AND Task.notification_frequency_id!=1
GROUP BY Task.task_id, CAST(Task.description AS varchar(255)), Task.name,
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

