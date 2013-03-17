
<!--common_files/qry_get_ref_task_status.cfm
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
	--> application.last_updated: date that marks the last time the REF_Task_Status table changed
	<-- task_status_id: number that identifies a status to workstream
	<-- status: string that contains the name (of the status) to display to the user
 --->
<cfquery name="get_ref_task_status" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT task_status_id, description
FROM REF_Task_Status
WHERE <cfqueryparam value="#application.last_updated#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#application.last_updated#" cfsqltype="cf_sql_timestamp" />
ORDER BY sort_order
</cfquery>
</cfsilent>