
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
	$Id: qry_time_entry_details.cfm 27935 2006-12-01 16:39:11Z jfrench $
	Task 49908 2006/11/27 Cecile Sy
	Updated query to pull task status for each  entry note. I also had a separate query for QA and resolution notes combined 

	Revision 1.5  2006-11-16 04:16:51  french
	Task 50669: Modified code to make system appear professional again.
	
	Revision 1.4  2005/11/01 13:29:30  french
	Added task details note sorting options. Task 37158

	Revision 1.3  2005-03-09 13:29:54-05  stetzer
	<>

	Revision 1.2  2005-03-09 13:27:22-05  stetzer
	<>

	Revision 1.1  2005-03-08 12:18:54-05  french
	Modified order of notes for Adam. He wants the to display in the order they were entered and not by order of the day the work was performed.

	Revision 1.0  2005-02-15 16:00:27-05  daugherty
	Initial revision
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

