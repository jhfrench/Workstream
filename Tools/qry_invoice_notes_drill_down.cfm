
<!--Tools/qry_invoice_notes_drill_down.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the modules that a user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
<cfquery name="invoice_notes_drill_down" datasource="#application.datasources.main#">
SELECT Time_Entry.notes_id, Time_Entry.time_entry_id, Time_Entry.date,
	Time_Entry.hours, Notes.note, Time_Entry.task_id
FROM Time_Entry, Notes
WHERE Time_Entry.notes_id=Notes.notes_id
	AND Time_Entry.project_id=#attributes.project_id#
	AND Time_Entry.emp_id=#attributes.emp_id#
	AND EXTRACT(MONTH FROM Time_Entry.date)=#attributes.month#
	AND EXTRACT(YEAR FROM Time_Entry.date)=#attributes.year#
ORDER BY Time_Entry.date, Time_Entry.time_entry_id
</cfquery>
</cfsilent>