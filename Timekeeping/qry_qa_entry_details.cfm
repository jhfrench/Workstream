
<!--Timekeeping/qry_qa_entry_details.cfm
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
	Revision 1.5  2006-11-16 04:16:51  french
	Task 50669: Modified code to make system appear professional again.
	
	Revision 1.4  2006-04-12 16:08:36-04  csy
	task 43531 Modifed code to seperate notes in Print Task QA section.

	Revision 1.3  2006-03-31 04:22:53-05  french
	Added task details note sorting options. Task 37158

	Revision 1.2  2006-02-15 08:22:01-05  stetzer
	Changed date to pull from Notes table rather than Time_Entry table so we can display the time in addition to the date.

	Revision 1.1  2005-03-09 13:27:04-05  stetzer
	<>

	Revision 1.2  2002-04-11 14:22:36-04  french
	Made change to also show second initial of employee.

	Revision 1.1  2001-10-11 10:54:39-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted from the express timekeeping page
 --->
<cfparam name="session.workstream_notes_display_sort" default="2">
<cfif session.workstream_notes_display_sort EQ 1>
	<!--- User wants to sort output by date of the work --->
	<cfset variables.date_sort_field="ISNULL(Time_Entry.date, Notes.date)">
<cfelse>
	<!--- User wants to sort output by date they entered the time --->
	<cfset variables.date_sort_field="ISNULL(Notes.date, Time_Entry.date)">
</cfif>
<cfquery name="qa_entry_details" datasource="#application.datasources.main#">
SELECT Notes.notes_type_id, (Emp_Contact.lname+', '+LEFT(Emp_Contact.name,2)) AS initials, #variables.date_sort_field# AS date, Notes.note AS note
FROM Notes, Time_Entry, Emp_Contact
WHERE Notes.task_id=#attributes.task_id#
	AND Notes.notes_id*=Time_Entry.notes_id
	AND Notes.emp_id=Emp_Contact.emp_id
	AND Notes.notes_type_id IN (5,2)
ORDER BY #variables.date_sort_field#, Time_Entry.time_entry_id
</cfquery>
</cfsilent>

