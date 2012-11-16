
<!--Reports/qry_get_employee_force.cfm
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
	<cfmodule template="sql_employee_force.cfm" user_account_id="#attributes.user_account_id#" from_date="#attributes.from_date#" through_date="#attributes.through_date#" show_budgeted_ind="#attributes.show_budgeted_ind#" show_completed="#attributes.show_completed#">
ORDER BY Task.status_id DESC, billable, Task.priority_id
</cfquery>
</cfsilent>
