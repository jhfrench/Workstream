
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
FROM get_revenue_goal(<cfqueryparam value="#session.workstream_company_id#" cfsqltype="cf_sql_integer">)
</cfquery>
</cfsilent>