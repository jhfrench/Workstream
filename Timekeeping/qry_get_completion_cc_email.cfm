
<!--Timekeeping/qry_get_completion_cc_email.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the user_account_id of the people who are to receive email reminders of a task's due_date.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	<-- email_id: list that contains the user_account_id's of everyone who is supposed to be CC'd on the email
 --->
<cfquery name="get_completion_cc_email" datasource="#application.datasources.main#">
SELECT Email.user_account_id AS email_id
FROM Notification
	INNER JOIN Email ON Notification.email_id=Email.email_id
		AND Email.active_ind=1
		AND Email.email_type_id=1
WHERE Notification.active_ind=1
	AND Notification.notification_type=6
	AND Notification.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>
