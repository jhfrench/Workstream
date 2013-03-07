
<!--common_files/qry_get_ref_project_health.cfm
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
	--> application.last_updated: date that marks the last time the REF_project_health table changed
	<-- project_health_id: number that identifies a status to workstream
	<-- status: string that contains the name (of the status) to display to the user
 --->
<cfquery name="get_ref_project_health" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT project_health_id, description, badge,
	icon
FROM REF_Project_Health
WHERE #application.last_updated#=#application.last_updated#
ORDER BY sort_order
</cfquery>
</cfsilent>