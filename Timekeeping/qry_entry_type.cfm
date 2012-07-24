
<!--Timekeeping/qry_entry_type.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task reminder information. A task reminder is an email that is intended to remind the user about an imminent task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> request.time_entry_id: number that uniquely identifies a time entry
	<-- entry_type: boolean indicating whether or not a time entry has a task_id
 --->
<cfquery name="entry_type" datasource="#application.datasources.main#">
SELECT Time_Entry.task_id AS task_id
FROM Time_Entry
WHERE Time_Entry.active_ind=1
	AND Time_Entry.time_entry_id=#request.time_entry_id#
</cfquery>
<cfif len(entry_type.task_id)>
	<cfset variables.entry_type=entry_type.task_id>
<cfelse>
	<cfset variables.entry_type=FALSE>
</cfif>
</cfsilent>

