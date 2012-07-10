
<!--Timekeeping/qry_insert_new_task.cfm
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
	--> attributes.budgeted_hours: number of hours that the task is targeted to take; if the number is less than 1 it will be bumped up to 1 hour because otherwise the DB would knock it down to 0
	--> attributes.date_start: date of when the new task is to be started
	--> attributes.due_date: date of when the new task is to be completed before
	--> attributes.icon_id: number corresponding to the icon assigned to the task
	--> attributes.priority_id: number that indicates the priority of the new task
	--> attributes.project_id: number that indicates which project the new task belongs to
	--> attributes.task_details: string of text that describes the work processes and conditions necessary for succesful completion of the task
	--> attributes.task_name: string containing the name the user entered for the new task
	--> attributes.task_status: number that indicates the current status of the new task (a task can be created after work for that task has already begun)
	--> session.user_account_id: number that identifies the workstream account that created the task
 --->
<cftransaction isolation="READ_COMMITTED">
<cfquery name="insert_new_task" datasource="#application.datasources.main#">
SET NOCOUNT ON
INSERT INTO Task (name, project_id, entry_date, 
	assigned_date, due_date, icon_id,
	budgeted_hours, status_id, description,
	creator, task_read, priority_id<!--- ,
	notification_frequency_id --->)
VALUES ('#attributes.task_name#', #attributes.project_id#, CURRENT_TIMESTAMP,
	#CreateODBCDate(attributes.date_start)#, #CreateODBCDate(attributes.due_date)#, #attributes.icon_id#,
	#ceiling(attributes.budgeted_hours)#, #attributes.task_status#, '#attributes.task_details#',
	#session.user_account_id#, 0, #attributes.priority_id#<!--- ,
	#attributes.notification_frequency_id# --->)
SELECT IDENT_CURRENT('Task') AS task_id
</cfquery>
<cfset attributes.task_id=insert_new_task.task_id>
<cfquery name="insert_task_source" datasource="#application.datasources.main#">
INSERT INTO Team(task_id,emp_id,role_id)
VALUES (#attributes.task_id#,#session.user_account_id#,5)
</cfquery>
</cftransaction>
</cfsilent>

