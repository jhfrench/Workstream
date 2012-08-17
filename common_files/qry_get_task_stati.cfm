
<!--common_files/qry_get_task_stati.cfm
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
	--> application.last_updated: date that marks the last time the get_task_stati query changed
	<-- status_id: number that identifies a status to workstream
	<-- status: string that contains the name (of the status) to display to the user
 --->
<cfquery name="get_task_stati" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT status_id, status
FROM REF_Status
WHERE #application.last_updated#=#application.last_updated#
ORDER BY sort_order
</cfquery>
</cfsilent>

