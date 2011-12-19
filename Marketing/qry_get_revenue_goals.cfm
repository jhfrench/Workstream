
<!-- marketing/qry_get_revenue_goals.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query the database to get the revenue goal for the company
	the user works for, for the current year.

	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
	
	<cfquery name="get_revenue_goals" datasource="#application.datasources.main#">
    SELECT isnull(revenue_goal, 0) as revenue_goal
    FROM revenue_goals
    WHERE company_id = #session.workstream_company_id# and year(fiscal_year) = year(GETDATE())
    </cfquery>
</cfsilent>
