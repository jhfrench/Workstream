
<!--Timekeeping/qry_time_entry_details.cfm
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
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfparam name="session.workstream_notes_display_sort" default="2">
<cfif session.workstream_notes_display_sort EQ 1>
	<!--- User wants to sort output by date of the work --->
	<cfset variables.date_sort_field="ISNULL(Time_Entry.date, Notes.date)">
<cfelse>
	<!--- User wants to sort output by date they entered the time --->
	<cfset variables.date_sort_field="ISNULL(Notes.date, Time_Entry.date)">
</cfif>
<cfquery name="time_entry_details" datasource="#application.datasources.main#">
SELECT Notes.notes_type_id, (Emp_Contact.lname + ', ' + LEFT(Emp_Contact.name,2)) AS initials, #variables.date_sort_field# AS date, Notes.note AS note
FROM Notes, Time_Entry, Emp_Contact
WHERE Notes.task_id=#attributes.task_id#
	AND Notes.notes_id*=Time_Entry.notes_id
	AND Notes.emp_id=Emp_Contact.emp_id
	AND Notes.notes_type_id IN (1,2,3,4,5,7)
ORDER BY #variables.date_sort_field#, Time_Entry.time_entry_id
</cfquery>
</cfsilent>
