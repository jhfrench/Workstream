
<!--Timekeeping/qry_get_project_details.cfm
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
	--> session.user_account_id: id that identifies user to workstream
	<-- notes_id: number that uniquely identifies a Notes entry
	<-- project_id: number that uniquely identifies a Project entry
 --->
<cfparam name="ii" default=1>
<cfquery name="get_project_details" datasource="#application.datasources.main#">
SELECT CURRVAL('Notes_notes_id_SEQ') AS notes_id<cfif NOT isdefined("project_entry")>, Task.project_id
FROM  Task
WHERE task.task_id=#listgetat(attributes.task_id,ii)# 
GROUP BY task.project_id</cfif> 
</cfquery>
</cfsilent>

