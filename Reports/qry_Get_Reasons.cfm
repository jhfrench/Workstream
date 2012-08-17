
<!--reports/qry_Get_Reasons.cfm
	Author: Jeromy F-->
	<!--- FUSEDOC
	||
	Responsibilities: I query out the different separation reasons that populate the REF_Separation_Reason table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	<-- reason_ID: number associated witha reason
	<-- reason_desc: string that contains a reason's label or description.
	END FUSEDOC --->
<cfquery name="get_reasons" datasource="#application.datasources.main#">
SELECT reason_id, turn_reason AS separation_reason<!--- $issue$: why alias this? --->
FROM REF_Turn_Reason
WHERE reason_id!=3
</cfquery>

