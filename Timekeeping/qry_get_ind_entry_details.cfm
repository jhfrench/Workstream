
<!--Timekeeping/qry_get_ind_entry_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.emp_id: id that identifies user to workstream
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	<-- date: date for a Time_Entry record
	<-- hours: number of hours for a Time_Entry record
	<-- note: string containing the notes that the user entered for a piece of work completed
	<-- time_entry_id: number that uniquely identifies a Time_Entry record
 --->
<cfquery name="get_ind_entry_details" datasource="#application.datasources.main#">
SELECT Time_Entry.notes_id AS notes_id, Time_Entry.time_entry_id AS time_entry_id, Time_Entry.date AS date, Time_Entry.hours AS hours, Notes.note AS note
FROM Time_Entry, Notes
WHERE Time_Entry.notes_id=Notes.notes_id
	AND Time_Entry.task_id=#attributes.task_id#
	AND Time_Entry.emp_id=#attributes.emp_id#
ORDER BY Time_Entry.date desc
</cfquery>
</cfsilent>

