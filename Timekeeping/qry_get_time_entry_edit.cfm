
<!--Timekeeping/qry_get_time_entry_edit.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve tasks from the timekeeping database based on the environment and needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- customer_description: string that identifies the customer for a particular task
	<-- date: date of when the work was done for a particular task
	<-- hours: number of hours completed for a particular timekeeping entry
	<-- note: string, sometimes large, that contains the task description notes
	<-- notes_id: number that corresponds to the identity column of the Notes table
	<-- project_description: string that identifies the project for a particular task
	<-- task_name: string that identifies the task name for a particular task
 --->
<!--- $issue$ hours as hours --->
<!--- $issue$ note as note --->
<!--- $issue$ notes_id as notes_id --->
<cfquery name="get_time_entry_edit" datasource="#application.datasources.main#">
SELECT Time_Entry.work_date, Time_Entry.hours AS hours, Demographics.last_name AS completed_by,
	Notes.notes_id AS notes_id, Notes.note AS note, Notes.notes_type_id,
	Task.task_id, Task.name AS task_name, Project.description AS project_description,
	Project.project_id, Customer.description AS customer_description
FROM Time_Entry
	LEFT OUTER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
		AND Notes.active_ind=1
	LEFT OUTER JOIN Task ON Time_Entry.task_id=Task.task_id
	LEFT OUTER JOIN Project ON Time_Entry.project_id=Project.project_id
	LEFT OUTER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN Demographics ON Time_Entry.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Time_Entry.active_ind=1
	AND Time_Entry.time_entry_id=<cfqueryparam value="#attributes.time_entry_id#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>
