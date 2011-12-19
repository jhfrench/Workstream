
<!--Timekeeping/act_delete_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I delete all records pertaining to a particular task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="delete_task_notifications" datasource="#application.datasources.main#">
DELETE
FROM Notification
WHERE task_id=#attributes.task_id#
</cfquery>
<cfquery name="delete_task_team" datasource="#application.datasources.main#">
DELETE
FROM Team
WHERE task_id=#attributes.task_id#
</cfquery>
<cfquery name="delete_associated_files" datasource="#application.datasources.main#">
DELETE
FROM Associated_Files
WHERE task_id=#attributes.task_id#
</cfquery>
<cfquery name="delete_associated_tasks" datasource="#application.datasources.main#">
DELETE
FROM Task_Link
WHERE base_task_id=#attributes.task_id#
	OR linked_task_id=#attributes.task_id#
</cfquery>
<cfquery name="delete_forceplanner_entries" datasource="#application.datasources.main#">
DELETE
FROM Forecast_Assignment
WHERE task_id=#attributes.task_id#
</cfquery>
<cfquery name="delete_task" datasource="#application.datasources.main#">
DELETE
FROM Task
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

