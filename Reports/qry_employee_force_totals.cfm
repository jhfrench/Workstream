
<!--Reports/qry_employee_force_totals.cfm
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
<cfquery name="employee_force_totals" datasource="#application.datasources.main#">
SELECT AVG(given_days) AS given_days,
	AVG(duration_days) AS duration_days,
	AVG(on_time)*100 AS on_time,
	AVG(on_budget)*100 AS on_budget
FROM
	(<cfinclude template="sql_employee_force.cfm">)
AS temp_table
</cfquery>
</cfsilent>
