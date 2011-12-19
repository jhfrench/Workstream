
<!--Timekeeping/qry_update_task_reminder_days.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task reminder information. A task reminder is an email that is intended to remind the user about an imminent task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_email_id" datasource="#application.datasources.main#">
SELECT ISNULL(email_id,0) AS email_id
FROM Email
WHERE emp_id=#attributes.task_owner#
</cfquery>
<cfif get_email_id.recordcount>
	<cfset email_id=get_email_id.email_id>
<cfelse>
	<cfset email_id=0>
</cfif>
<cfquery name="update_task_reminder_days" datasource="#application.datasources.main#">
DELETE
FROM Notification
WHERE task_id=#attributes.task_id# AND notification_type=1
</cfquery>
<cfif len(attributes.reminder_days)>
<cfquery name="update_task_reminder_days" datasource="#application.datasources.main#">
INSERT INTO Notification (task_id, email_id, date_to_send,
	date_sent, days_before_due, notification_type)
VALUES (#attributes.task_id#, #email_id#, <cfif isdefined("attributes.due_date")>#CreateODBCDate(dateadd("d",-attributes.reminder_days,attributes.due_date))#<cfelse>#CreateODBCDate(dateadd("d",-attributes.reminder_days,attributes.orig_due_date))#</cfif>,
	NULL, #attributes.reminder_days#, 1)
</cfquery>
</cfif>
</cfsilent>

