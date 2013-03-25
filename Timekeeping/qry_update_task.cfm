
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
	<cfif compare(attributes.task_description,attributes.orig_task_description)>description=<cfqueryparam value="#attributes.task_description#" cfsqltype="cf_sql_varchar" />,</cfif>
	<cfif compare(attributes.due_date,attributes.orig_due_date)>due_date=<cfqueryparam value="#createodbcdate(attributes.due_date)#" cfsqltype="cf_sql_date" />,</cfif>
	<cfif compare(attributes.task_name,attributes.orig_task_name)>name=<cfqueryparam value="#attributes.task_name#" cfsqltype="cf_sql_varchar" />,</cfif>
	<cfif compare(attributes.priority_id,attributes.orig_priority_id)>priority_id=<cfqueryparam value="#attributes.priority_id#" cfsqltype="cf_sql_integer" />,</cfif>
</cfif>
<cfif compare(attributes.task_status,attributes.orig_task_status_id) AND attributes.task_status EQ 7>
	complete_date=CURRENT_TIMESTAMP,
	completed_by=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />,
</cfif>
	<cfif compare(attributes.icon_id,attributes.orig_icon_id)>icon_id=<cfqueryparam value="#attributes.icon_id#" cfsqltype="cf_sql_integer" />,</cfif>
	<!--- notification_frequency_id=#attributes.notification_frequency_id#, --->
	active_ind=active_ind
WHERE task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />;

<cfif compare(attributes.task_status,attributes.orig_task_status_id)>
UPDATE Link_Task_Task_Status
SET active_ind=0
WHERE active_ind=1
	AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />;

INSERT INTO Link_Task_Task_Status (task_id, task_status_id, created_by)
VALUES (<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />, #attributes.task_status#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);
</cfif>
</cfquery>
</cfsilent>
