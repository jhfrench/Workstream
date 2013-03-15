
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
SELECT *
FROM get_revenue_goal(#session.workstream_company_id#)
</cfquery>
</cfsilent>