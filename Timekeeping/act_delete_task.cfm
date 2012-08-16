
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
<cfquery name="delete_task" datasource="#application.datasources.main#">
UPDATE Task
SET active_ind=0,
	deleted_date=CURRENT_TIMESTAMP,
	deleted_by=#session.user_account_id#
WHERE active_ind=1
	AND task_id IN (#attributes.task_id#)
</cfquery>
</cfsilent>
