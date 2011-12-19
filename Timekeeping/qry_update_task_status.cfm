
<!--Timekeeping/qry_update_task_status.cfm
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
<cfquery name="update_task_status" datasource="#application.datasources.main#">
UPDATE Task
SET status_id=#attributes.task_status#<cfif attributes.task_status EQ 11>, 
	complete_date=#now()#,
	completed_by=#session.user_account_id#</cfif>
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

