
<!--Timekeeping/qry_get_time_entry_details.cfm
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
<cfquery name="get_time_entry_details" datasource="#application.datasources.main#">
SELECT Time_Entry.time_entry_id, COALESCE(Time_Entry.work_date, Notes.created_date) AS work_date, Time_Entry.hours,
	Notes.notes_id, Notes.notes_type_id, Notes.note,
	(Demographics.last_name || ', ' || Demographics.first_name) AS author, (LEFT(Demographics.first_name,1) || LEFT(Demographics.last_name,1)) AS initials, Task.task_id,
	Task.name AS task_name, Project.project_id, Project.description AS project_description,
	Customer.description AS customer_description, COALESCE(Link_Invoice_Time_Entry.time_entry_id,0) AS billed_ind
FROM Time_Entry
	LEFT OUTER JOIN Notes ON Time_Entry.notes_id=Notes.notes_id
		AND Notes.active_ind=1
	LEFT OUTER JOIN Demographics ON Time_Entry.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	LEFT OUTER JOIN Task ON Time_Entry.task_id=Task.task_id
	LEFT OUTER JOIN Project ON Time_Entry.project_id=Project.project_id
	LEFT OUTER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN (
		SELECT time_entry_id
		FROM Link_Invoice_Time_Entry
			INNER JOIN Invoice ON Link_Invoice_Time_Entry.invoice_id=Invoice.invoice_id
				AND Invoice.active_ind=1
		WHERE Link_Invoice_Time_Entry.active_ind=1
	) AS Link_Invoice_Time_Entry ON Time_Entry.time_entry_id=Link_Invoice_Time_Entry.time_entry_id
WHERE Time_Entry.active_ind=1<cfif isdefined("attributes.time_entry_id")>
	AND Time_Entry.time_entry_id=<cfqueryparam value="#attributes.time_entry_id#" cfsqltype="cf_sql_integer" /><cfelse>
	AND Time_Entry.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" /><cfif isdefined("attributes.user_account_id#")>
	AND Time_Entry.user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" /></cfif></cfif>
ORDER BY COALESCE(Time_Entry.work_date, Notes.created_date), Time_Entry.time_entry_id
</cfquery>
</cfsilent>