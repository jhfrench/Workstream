
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
	AND task_id=#attributes.task_id#
	AND date > '#express_check_date.date_locked#'
UPDATE Notes
SET task_id=#attributes.reassign_task_id#
WHERE Notes.active_ind=1
	AND emp_id IN (#attributes.reassign_hours#)
	AND task_id=#attributes.task_id#
	AND date > '#express_check_date.date_locked#'
</cfquery>
</cfsilent>

