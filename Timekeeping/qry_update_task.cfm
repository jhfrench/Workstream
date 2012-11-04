
<!--Timekeeping/qry_update_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task name.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task" datasource="#application.datasources.main#">
UPDATE Task
SET <cfif get_editing_privileges.recordcount>
	/* task details can be edited by this person (task owner, supervisor of task owner, task source, or task creator) */
	<cfif compare(attributes.task_description,attributes.orig_task_description)>description='#attributes.task_description#',</cfif>
	<cfif compare(attributes.due_date,attributes.orig_due_date)>due_date=#createodbcdate(attributes.due_date)#,</cfif>
	<cfif compare(attributes.task_name,attributes.orig_task_name)>name='#attributes.task_name#',</cfif>
	<cfif compare(attributes.priority_id,attributes.orig_priority_id)>priority_id=#attributes.priority_id#,</cfif>
</cfif>
<cfif compare(attributes.task_status,attributes.orig_task_status_id)>
	status_id=#attributes.task_status#,<cfif attributes.task_status EQ 7> 
	complete_date=CURRENT_TIMESTAMP,
	completed_by=#variables.user_identification#,</cfif>
</cfif>
	<cfif compare(attributes.icon_id,attributes.orig_icon_id)>icon_id=#attributes.icon_id#,</cfif>
	<!--- notification_frequency_id=#attributes.notification_frequency_id#, --->
	active_ind=active_ind
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>
