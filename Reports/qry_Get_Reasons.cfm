
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
Revision 1.1  2005/03/09 18:13:29  stetzer
<>

Revision 1.1  2001-10-11 11:03:59-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	<-- reason_ID: number associated witha reason
	<-- reason_desc: string that contains a reason's label or description.
	END FUSEDOC --->
<cfquery name="get_Reasons" datasource="#application.datasources.main#">
SELECT reason_ID, turn_reason AS separation_reason
FROM REF_Turn_Reason
WHERE reason_id != 3
</cfquery>

