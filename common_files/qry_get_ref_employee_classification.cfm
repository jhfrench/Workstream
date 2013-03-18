
<!--Directory/qry_get_ref_employee_classification.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a demographics record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
 --->
<cfquery name="get_ref_employee_classification" datasource="#application.datasources.main#">
SELECT *
FROM REF_Employee_Classification
ORDER BY employee_classification_id
</cfquery>
</cfsilent>
