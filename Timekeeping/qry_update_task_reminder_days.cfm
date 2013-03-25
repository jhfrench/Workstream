
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
<cfquery name="update_task_reminder_days" datasource="#application.datasources.main#">
UPDATE Notification
SET active_ind=0
WHERE active_ind=1
	AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND notification_type=1
</cfquery>
<cfif len(attributes.reminder_days)>
	<cfquery name="update_task_reminder_cc" datasource="#application.datasources.main#">
	INSERT INTO Notification (task_id, email_id, notification_type,
		created_by)
	SELECT #attributes.task_id#, email_id, 1,
		#variables.user_identification#
	FROM Email
	WHERE active_ind=1
		AND user_account_id=<cfqueryparam value="#attributes.task_owner#" cfsqltype="cf_sql_integer" />
	</cfquery>
</cfif>
</cfsilent>