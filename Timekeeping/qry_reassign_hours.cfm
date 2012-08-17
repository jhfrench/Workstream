
<!--Timekeeping/qry_reassign_hours.cfm
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
<cfquery name="get_project_id" datasource="#application.datasources.main#">
SELECT project_id
FROM Task
WHERE task_id=#attributes.reassign_task_id#
</cfquery>
<cfquery name="reassign_hours" datasource="#application.datasources.main#">
UPDATE Time_Entry
SET task_id=#attributes.reassign_task_id#,
	project_id=#get_project_id.project_id#
WHERE Time_Entry.active_ind=1
	AND emp_id IN (#attributes.reassign_hours#)
	AND time_entry_id NOT IN (
		/* don't reassign hours that have already been billed*/
		SELECT time_entry_id
		FROM Link_Invoice_Time_Entry
			INNER JOIN Invoice ON Link_Invoice_Time_Entry.invoice_id=Invoice.invoice_id
		WHERE Link_Invoice_Time_Entry.active_ind=1
			AND Invoice.active_ind=1
		GROUP BY time_entry_id
	);

UPDATE Notes
SET task_id=#attributes.reassign_task_id#
FROM Time_Entry
WHERE Time_Entry.notes_id=Notes.notes_id
	AND Notes.active_ind=1
	AND Notes.emp_id IN (#attributes.reassign_hours#)
	AND Time_Entry.time_entry_id NOT IN (
		/* don't reassign hours that have already been billed*/
		SELECT time_entry_id
		FROM Link_Invoice_Time_Entry
			INNER JOIN Invoice ON Link_Invoice_Time_Entry.invoice_id=Invoice.invoice_id
		WHERE Link_Invoice_Time_Entry.active_ind=1
			AND Invoice.active_ind=1
		GROUP BY time_entry_id
	);
</cfquery>
</cfsilent>

