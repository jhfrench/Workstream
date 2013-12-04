
<!--Timekeeping/qry_update_time_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the Time_Entry table with the information returned from pag_time_entry_edit.cfm.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> [attributes.delete]: boolean that indicates a the specified record should be deleted from the table. If attributes.delete does not exist than the record should be updated with the provided data.
	--> attributes.date: date that the user wishes to update the Time_Entry.work_date field with.
	--> attributes.hours: number of hours that the user wishes to update the Time_Entry.hours field with.
	--> attributes.time_entry_id: number that corresponds to the identity column of the Time_Entry table.
 --->
</cfsilent>
<cfquery name="update_time_entry" datasource="#application.datasources.main#">
UPDATE Time_Entry
SET active_ind=0
WHERE time_entry_id=<cfqueryparam value="#attributes.time_entry_id#" cfsqltype="cf_sql_integer" />;
<cfif isdefined("attributes.method") AND comparenocase(attributes.method,"delete this entry")>
INSERT INTO Time_Entry (user_account_id, work_date, hours,
	project_id, task_id, notes_id,
	created_by)
SELECT user_account_id, <cfqueryparam value="#createodbcdate(attributes.work_date)#" cfsqltype="cf_sql_date" />, <cfqueryparam value="#attributes.hours#" cfsqltype="cf_sql_numeric" />,
	<cfif isdefined("attributes.project_id")><cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" /><cfelse>project_id</cfif>, task_id, <cfqueryparam value="#update_notes.notes_id#" cfsqltype="cf_sql_integer" />,
	<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
FROM Time_Entry
WHERE time_entry_id=<cfqueryparam value="#attributes.time_entry_id#" cfsqltype="cf_sql_integer" />;
</cfif>
</cfquery>