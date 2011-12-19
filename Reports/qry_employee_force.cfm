
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
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="employee_force" datasource="#application.datasources.main#">
	<cfinclude template="sql_employee_force.cfm">
ORDER BY Task.status_id DESC, billable, Task.priority_id
</cfquery>
</cfsilent>
