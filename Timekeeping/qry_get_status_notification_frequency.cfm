
<!--Timekeeping/qry_get_status_notification_frequency.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I get the status notification frequency for a task.
	||
	Name: Jeromy French
	||
	Edits:


 
	 || 

 --->

<cfquery name="get_status_notification_frequency" datasource="#application.datasources.main#">
SELECT frequency
FROM Notification
WHERE task_id = #attributes.task_id#
	AND notification_type = 1
</cfquery>
</cfsilent>