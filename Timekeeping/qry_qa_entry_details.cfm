
<!--Timekeeping/qry_qa_entry_details.cfm
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
	--> attributes.task_id: list that contains task id's submitted from the express timekeeping page
 --->
<cfparam name="session.workstream_notes_display_sort" default="2">
<cfif session.workstream_notes_display_sort EQ 1>
	<!--- User wants to sort output by date of the work --->
	<cfset variables.date_sort_field="COALESCE(Time_Entry.date, Notes.created_date)">
<cfelse>
	<!--- User wants to sort output by date they entered the time --->
	<cfset variables.date_sort_field="COALESCE(Notes.created_date, Time_Entry.date)">
</cfif>
<cfquery name="qa_entry_details" datasource="#application.datasources.main#">
SELECT Notes.notes_type_id, (Emp_Contact.lname || ', ' || LEFT(Emp_Contact.name,2)) AS initials, #variables.date_sort_field# AS date, Notes.note AS note
FROM Notes
	LEFT OUTER JOIN Time_Entry ON Notes.notes_id=Time_Entry.notes_id
		AND Time_Entry.active_ind=1
	INNER JOIN Emp_Contact ON Notes.emp_id=Emp_Contact.emp_id
WHERE Notes.active_ind=1
	AND Notes.task_id=#attributes.task_id#
	AND Notes.notes_type_id IN (5,2)
ORDER BY #variables.date_sort_field#, Time_Entry.time_entry_id
</cfquery>
</cfsilent>

