
<!--Directory/qry_get_employee_classification.cfm
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
<cfquery name="get_employee_classification" datasource="#application.datasources.main#">
SELECT *
FROM REF_Employee_Classification
</cfquery>
</cfsilent>

