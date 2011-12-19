
<!--common_files/qry_get_revenue_goal.cfm
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
<cfquery name="get_revenue_goal" datasource="#application.datasources.main#">
SELECT SUM(revenue_progress) AS revenue_progress, SUM(revenue_goal) AS revenue_goal
FROM Revenue_Goal
WHERE fiscal_year=YEAR(GETDATE())
	AND company_id=#session.workstream_company_id#
</cfquery>
</cfsilent>

