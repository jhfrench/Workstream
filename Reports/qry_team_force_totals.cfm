
<!--Reports/qry_team_force_totals.cfm
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
<cfquery name="team_force_totals" datasource="#application.datasources.main#">
SELECT AVG(given_days) AS given_days, AVG(duration_days) AS duration_days, AVG(on_time)*100 AS on_time,
	AVG(on_budget)*100 AS on_budget
FROM (
	/* user_account_id is excluded from this query because we want the whole team as a benchmark */
	<cfmodule template="sql_employee_force.cfm" from_date="#attributes.from_date#" to_date="#attributes.to_date#" show_budgeted="#attributes.show_budgeted#" show_completed="#attributes.show_completed#">
	) AS temp_table
</cfquery>
</cfsilent>
