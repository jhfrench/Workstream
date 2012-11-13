
<!--Timekeeping/qry_time_entry_details.cfm
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
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfparam name="session.workstream_notes_display_sort" default="2">
<cfif session.workstream_notes_display_sort EQ 1>
	<!--- User wants to sort output by date of the work --->
	<cfset variables.date_sort_field="COALESCE(Time_Entry.work_date, Notes.created_date)">
<cfelse>
	<!--- User wants to sort output by date they entered the time --->
	<cfset variables.date_sort_field="COALESCE(Notes.created_date, Time_Entry.work_date)">
</cfif>
<cfquery name="time_entry_details" datasource="#application.datasources.main#">
SELECT Notes.notes_type_id, (Demographics.last_name || ', ' || Demographics.first_name) AS author, (LEFT(Demographics.first_name,1) || LEFT(Demographics.last_name,1)) AS initials,
	#variables.date_sort_field# AS date, Notes.note AS note
FROM Notes
	LEFT OUTER JOIN Time_Entry ON Notes.notes_id=Time_Entry.notes_id
		AND Time_Entry.active_ind=1
	INNER JOIN Demographics ON Notes.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Notes.active_ind=1
	AND Notes.task_id=#attributes.task_id#
	AND Notes.notes_type_id IN (1,2,3,4,5,7)
ORDER BY #variables.date_sort_field#, Time_Entry.time_entry_id
</cfquery>
</cfsilent>
