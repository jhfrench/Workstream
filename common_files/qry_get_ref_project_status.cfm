
<!--common_files/qry_get_ref_project_status.cfm
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
	--> application.last_updated: date that marks the last time the REF_project_Status table changed
	<-- project_status_id: number that identifies a status to workstream
	<-- status: string that contains the name (of the status) to display to the user
 --->
<cfquery name="get_ref_project_status" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT project_status_id, description
FROM REF_project_Status
WHERE #application.last_updated#=#application.last_updated#
ORDER BY sort_order
</cfquery>
</cfsilent>