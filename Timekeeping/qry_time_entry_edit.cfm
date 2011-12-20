
<!--Timekeeping/qry_time_entry_edit.cfm
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
	--> request.time_entry_id: number that corresponds to the identity column of the Time_Entry table, set at pag_time_entry_edit.cfm.
	<-- customer_description: string that identifies the customer for a particular task
	<-- date: date of when the work was done for a particular task
	<-- hours: number of hours completed for a particular timekeeping entry
	<-- note: string, sometimes large, that contains the task description notes
	<-- notes_id: number that corresponds to the identity column of the Notes table
	<-- project_description: string that identifies the project for a particular task
	<-- task_name: string that identifies the task name for a particular task
 --->
<cfquery name="time_entry_edit" datasource="#application.datasources.main#">
SELECT Time_Entry.date AS date, Time_Entry.hours AS hours,
	Notes.note AS note, Notes.notes_id AS notes_id,
	<cfif entry_type>Task.name AS task_name, Task.task_id AS task_id,
	</cfif>Project.description AS project_description, project.project_id,
	Customer.description AS customer_description
FROM Notes, Time_Entry, <cfif entry_type>Task, </cfif>Project, Customer
WHERE Notes.notes_id=Time_Entry.notes_id
	<cfif entry_type>AND Notes.task_id=Task.task_id</cfif>
	AND Time_Entry.project_id=Project.project_id
	AND Project.customer_id=Customer.customer_id
	<cfif entry_type>AND Time_Entry.task_id=Task.task_id</cfif>
	AND Time_Entry.time_entry_id=#request.time_entry_id#
</cfquery>
</cfsilent>