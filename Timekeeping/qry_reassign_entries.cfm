
<!--Timekeeping/qry_reassign_entries.cfm
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
<cfquery name="get_project_id" datasource="#application.datasources.main#">
SELECT project_id
FROM Task
WHERE task_id=#attributes.reassign_task_id#
</cfquery>
<cfquery name="qa_entry_details" datasource="#application.datasources.main#">
UPDATE Time_Entry
SET task_id=#attributes.reassign_task_id#,
	project_id=#get_project_id.project_id#
WHERE notes_id IN (#attributes.notes_id#);
UPDATE Notes
SET task_id=#attributes.reassign_task_id#
WHERE notes_id IN (#attributes.notes_id#);
</cfquery>
</cfsilent>

