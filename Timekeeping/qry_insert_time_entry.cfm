
<!--Timekeeping/qry_insert_time_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I upload the info to the Time_Entry table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.date: list that contains dates submitted from the express timekeeping page
	--> attributes.hours: list that contains hours submitted from the express timekeeping page
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	--> variables.user_identification: id that identifies user to workstream
	--> insert_notes.notes_id: number that uniquely identifies a Notes entry
 --->
<cfscript>
	if (isdefined("variables.hours_ii")) {
		variables.hours=listgetat(attributes.hours,variables.hours_ii);
		variables.work_date=createodbcdate(listgetat(attributes.date,variables.hours_ii));
	}
	else {
		variables.hours=attributes.hours;
		variables.work_date=createodbcdate(attributes.date);
	}
	if (isdefined("attributes.project_entry_ind")) {
		variables.project_id=listgetat(attributes.project_id,variables.hours_ii);
	}
	else {
		variables.task_id=listgetat(attributes.task_id,variables.hours_ii);
	}
</cfscript>


<cfquery name="insert_time_entry" datasource="#application.datasources.main#">
INSERT INTO Time_Entry (user_account_id, work_date, hours,
	project_id, task_id, notes_id,
	created_by)
<cfif isdefined("attributes.project_entry_ind")>
VALUES (<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.work_date#" cfsqltype="cf_sql_date" />, <cfqueryparam value="#variables.hours#" cfsqltype="cf_sql_numeric" />,
	<cfqueryparam value="#variables.project_id#" cfsqltype="cf_sql_integer" />, NULL, <cfqueryparam value="#insert_notes.notes_id#" cfsqltype="cf_sql_integer" />,
	<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
<cfelse>
SELECT <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.work_date#" cfsqltype="cf_sql_date" />, <cfqueryparam value="#variables.hours#" cfsqltype="cf_sql_numeric" />,
	Task.project_id, <cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#insert_notes.notes_id#" cfsqltype="cf_sql_integer" />,
	<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
FROM Task
WHERE Task.task_id=<cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />
</cfif>
</cfquery>
</cfsilent>
