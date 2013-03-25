
<!--Timekeeping/qry_update_task_project_id.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task's project, including any time entries that haven't already been billed.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_project_id" datasource="#application.datasources.main#">
UPDATE Task
SET project_id=<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />
WHERE task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />;

UPDATE Time_Entry
SET project_id=<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" />
WHERE Time_Entry.active_ind=1
	AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND time_entry_id NOT IN (
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
