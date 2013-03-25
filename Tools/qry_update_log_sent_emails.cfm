
<!--Tools/qry_update_log_sent_emails.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I log emails sent to notify about the status changes of tasks
	||
	Name: Jeromy F
	 ||

 --->
<cfquery name="update_log_sent_emails" datasource="#application.datasources.main#">
INSERT INTO Notification (task_id, email_id, notification_type,
	date_sent, created_by)
VALUES (#get_daily_email_list.task_id#, #get_daily_email_list.email_id#, #get_daily_email_list.notification_type#,
	CURRENT_TIMESTAMP , #variables.user_identification#)
</cfquery>
</cfsilent>

