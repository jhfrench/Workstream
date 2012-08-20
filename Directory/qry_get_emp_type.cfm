
<!--Directory/qry_get_emp_type.cfm
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
<cfquery name="get_emp_type" datasource="#application.datasources.main#">
SELECT *
FROM REF_Employee_Type
</cfquery>
</cfsilent>

