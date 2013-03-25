
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
WHERE active_ind=1
	AND notification_type=1
	AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>