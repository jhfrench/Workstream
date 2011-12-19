
<!--Reports/qry_employee_force.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve tasks from the timekeeping database based on the environment and needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:12:57  stetzer
<>

Revision 1.1  2001-10-11 11:04:01-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="employee_force" datasource="#application.datasources.main#">
	<cfinclude template="sql_employee_force.cfm">
ORDER BY Task.status_id DESC, billable, Task.priority_id
</cfquery>
</cfsilent>
