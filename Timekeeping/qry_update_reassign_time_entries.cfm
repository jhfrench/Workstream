
<!--Timekeeping/qry_update_reassign_time_entries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted from the express timekeeping page
 --->
<cfquery name="update_reassign_time_entries" datasource="#application.datasources.main#">
UPDATE Time_Entry
SET task_id=<cfqueryparam value="#attributes.reassign_task_id#" cfsqltype="cf_sql_integer" />,
	project_id=<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />
WHERE Time_Entry.active_ind=1<cfif isdefined("attributes.notes_id")>
	AND Time_Entry.notes_id IN (<cfqueryparam value="#attributes.notes_id#" cfsqltype="cf_sql_integer" list="true" />)<cfelse>
	AND Time_Entry.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND Time_Entry.user_account_id IN (<cfqueryparam value="#attributes.reassign_hours#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
	AND Time_Entry.time_entry_id NOT IN (
		/* don't reassign hours that have already been billed*/
		SELECT time_entry_id
		FROM Link_Invoice_Time_Entry
			INNER JOIN Invoice ON Link_Invoice_Time_Entry.invoice_id=Invoice.invoice_id
		WHERE Link_Invoice_Time_Entry.active_ind=1
			AND Invoice.active_ind=1
		GROUP BY time_entry_id
	);

UPDATE Notes
SET task_id=<cfqueryparam value="#attributes.reassign_task_id#" cfsqltype="cf_sql_integer" />
FROM Time_Entry
WHERE Time_Entry.notes_id=Notes.notes_id
	AND Notes.active_ind=1<cfif isdefined("attributes.notes_id")>
	AND Notes.notes_id IN (<cfqueryparam value="#attributes.notes_id#" cfsqltype="cf_sql_integer" list="true" />)<cfelse>
	AND Notes.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND Notes.user_account_id IN (<cfqueryparam value="#attributes.reassign_hours#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
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