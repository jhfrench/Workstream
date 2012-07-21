
<!--Timekeeping/qry_update_notification_frequency.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the status notification frequency.
	||
	Name: Jeromy F
	||
	Edits:

 
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_notification_frequency" datasource="#application.datasources.main#">
UPDATE Task
SET notification_frequency_id=#attributes.notification_frequency_id#
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

