
<!--Directory/qry_get_benefit_types.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the different types of benefits.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log: 

	||
	Variables:

 --->
<cfquery name="get_benefit_types" datasource="#application.datasources.main#">
SELECT 	benefit_type_id, description
FROM REF_Benefit_Type
WHERE active_ind = 1
ORDER BY sort_order
</cfquery>
</cfsilent>
