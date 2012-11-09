
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
DELETE FROM Notification
WHERE task_id=#attributes.task_id#
	AND notification_type=5
</cfquery>
<cfloop list="#attributes.notification_to_id#" index="ii">
<cfquery name="get_email_id" datasource="#application.datasources.main#">
SELECT COALESCE(email_id,0) AS email_id
FROM Email
WHERE user_account_id=#ii#
</cfquery>
<cfif get_email_id.recordcount>
	<cfset email_id=get_email_id.email_id>
<cfelse>
	<cfset email_id=0>
</cfif>
<cfquery name="update_task_notification" datasource="#application.datasources.main#">
INSERT INTO Notification(task_id, email_id, notification_type)
VALUES (#attributes.task_id# ,#email_id#, 5)
</cfquery>
</cfloop>
</cfsilent>

