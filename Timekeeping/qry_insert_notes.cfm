
<!--Timekeeping/qry_insert_notes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I upload the info to the Notes table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> [attributes.file_path]: string, though the variable is essential used as a boolean--if it exists than the notes are being submitted from the task_details page
	--> attributes.notes_#ii#: string that contains the notes that correspond to a particular time entry
	--> attributes.notes_type_id: number that indicates what type of note is being entered into the database
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	--> variables.user_identification: id that identifies user to workstream
	--> variables.note: string that contains the note that corresponds to a particular time entry
 --->
<cfscript>
	if (NOT isdefined("attributes.notes_type_id")) {
		attributes.notes_type_id=1;
	}
	if (isdefined("attributes.file_path")) {
		variables.note=htmleditformat(attributes.notes);
	}
	else {
		variables.note=htmleditformat(evaluate("attributes.notes_#variables.hours_ii#"));
	}
	if (isdefined("attributes.project_entry_ind")) {
		variables.task_id="NULL";
	}
	else {
		variables.task_id=listgetat(attributes.task_id,variables.hours_ii);
	}
</cfscript>
<cfquery name="insert_notes" datasource="#application.datasources.main#">
INSERT INTO Notes (task_id, user_account_id, notes_type_id,
	note, created_by)
VALUES (<cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#attributes.notes_type_id#" cfsqltype="cf_sql_integer" />,
	'#variables.note#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
RETURNING notes_id
</cfquery>
</cfsilent>
