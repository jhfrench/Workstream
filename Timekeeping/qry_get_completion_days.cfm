
<!--Timekeeping/qry_get_completion_days.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task icon.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_completion_days" datasource="#application.datasources.main#">
SELECT days_before_due AS reminder_days
FROM Notification
WHERE Notification.active_ind=1
	AND notification_type=1
	AND task_id=#attributes.task_id#
</cfquery>
</cfsilent>

