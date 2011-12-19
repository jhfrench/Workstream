
<!--Timekeeping/qry_revenue_goal.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I get the revenue information.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="revenue_goal" datasource="#application.datasources.main#">
SELECT SUM(revenue_progress)/1000000 AS thermo_rev, SUM(revenue_progress) AS revenue_progress, SUM(revenue_goal) AS revenue_goal
FROM Revenue_Goals
WHERE fiscal_year = '12/31/03'
	AND company_id = 9
</cfquery>
</cfsilent>

