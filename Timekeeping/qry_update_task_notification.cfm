
<!--Timekeeping/qry_update_task_notification.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task owner.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_notification" datasource="#application.datasources.main#">
UPDATE Notification
SET active_ind=0
WHERE active_ind=1
	AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND notification_type=5
</cfquery>

<cfif len(attributes.notification_to_id)>
	<cfquery name="update_task_reminder_cc" datasource="#application.datasources.main#">
	INSERT INTO Notification (task_id, email_id, notification_type,
		created_by)
	SELECT #attributes.task_id#, email_id, 5,
		#variables.user_identification#
	FROM Email
	WHERE active_ind=1
		AND user_account_id IN (#attributes.notification_to_id#)
	</cfquery>
</cfif>
</cfsilent>