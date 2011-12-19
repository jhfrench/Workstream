
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
	Revision 1.0  2005/02/15 20:47:09  daugherty
	Initial revision

	Revision 1.2  2002-03-08 16:36:54-05  long
	changed the table to employee type.

	Revision 1.1  2001-10-11 12:20:35-04  long
	Added FuseDoc

	||
	Variables:
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
 --->
<cfquery name="get_emp_type" datasource="#application.datasources.main#">
SELECT *
FROM REF_Employee_Type
</cfquery>
</cfsilent>

