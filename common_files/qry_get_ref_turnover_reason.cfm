
<!--common_files/qry_get_ref_turnover_reason.cfm
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
	<-- turnover_reason_id: number associated witha reason
	<-- reason_desc: string that contains a reason's label or description.
	END FUSEDOC --->
<cfquery name="get_ref_turnover_reason" datasource="#application.datasources.main#">
SELECT turnover_reason_id, description, note
FROM REF_Turnover_Reason
WHERE turnover_reason_id!=3
</cfquery>

