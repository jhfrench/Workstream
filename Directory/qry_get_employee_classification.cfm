
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
	Revision 1.0  2005/02/15 20:47:02  daugherty
	Initial revision

	||
	Variables:
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
 --->
<cfquery name="get_employee_classification" datasource="#application.datasources.main#">
SELECT *
FROM REF_Employee_Classification
</cfquery>
</cfsilent>

