
<!--Timekeeping/qry_get_ind_entry_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.user_account_id: id that identifies user to workstream
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	<-- date: date for a Time_Entry record
	<-- hours: number of hours for a Time_Entry record
	<-- note: string containing the notes that the user entered for a piece of work completed
	<-- time_entry_id: number that uniquely identifies a Time_Entry record
 --->
<cfquery name="get_ind_entry_details" datasource="#application.datasources.main#">
SELECT Time_Entry.notes_id AS notes_id, Time_Entry.time_entry_id AS time_entry_id, Time_Entry.work_date,
	Time_Entry.hours AS hours, Notes.note AS note
FROM Time_Entry
	INNER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
WHERE Time_Entry.active_ind=1
	AND Notes.active_ind=1
	AND Time_Entry.task_id=#attributes.task_id#
	AND Time_Entry.user_account_id=#attributes.user_account_id#
ORDER BY Time_Entry.work_date DESC, Time_Entry.time_entry_id
</cfquery>
</cfsilent>

