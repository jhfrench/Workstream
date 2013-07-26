
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
<!--- $issue$ is this template used? --->
<!--- $issue$ can this be combined with qry_get_time_entry_edit.cfm, perhaps as part of qry_get_time_entry.cfm? --->
<cfquery name="get_ind_entry_details" datasource="#application.datasources.main#">
SELECT Time_Entry.notes_id, Time_Entry.time_entry_id, Time_Entry.work_date,
	Time_Entry.hours, Notes.note, COALESCE(Link_Invoice_Time_Entry.time_entry_id,0) AS billed_ind
FROM Time_Entry
	INNER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
		AND Notes.active_ind=1
	LEFT OUTER JOIN (
		SELECT time_entry_id
		FROM Link_Invoice_Time_Entry
			INNER JOIN Invoice ON Link_Invoice_Time_Entry.invoice_id=Invoice.invoice_id
				AND Invoice.active_ind=1
		WHERE Link_Invoice_Time_Entry.active_ind=1
	) AS Link_Invoice_Time_Entry ON Time_Entry.time_entry_id=Link_Invoice_Time_Entry.time_entry_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND Time_Entry.user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
ORDER BY Time_Entry.work_date DESC, Time_Entry.time_entry_id
</cfquery>
</cfsilent>
