
<!--Tools/qry_update_log_sent_emails.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I log emails sent to notify about the status changes of tasks
	||
	Name: Damon S
	||
	
 --->
<cfquery name="update_log_sent_emails" datasource="#application.datasources.main#">
INSERT INTO Notification (task_id, email_id, notification_type,
	date_sent)
VALUES (#get_daily_email_list.task_id#, #get_daily_email_list.email_id#, #get_daily_email_list.notification_type#,
	GETDATE())
</cfquery>
</cfsilent>

