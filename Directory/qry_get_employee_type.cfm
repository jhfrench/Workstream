
<!--Directory/qry_get_employee_type.cfm
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
	Revision 1.0  2005/02/15 20:47:03  daugherty
	Initial revision

	||
	Variables:
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
 --->
<cfquery name="qry_get_employee_type" datasource="#application.datasources.main#">
SELECT *
FROM REF_Employee_Type
</cfquery>
</cfsilent>

