
<!--Tools/qry_get_forecast.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the forecast id that corresponds to a given month, year, and forceplanner user's user_account_id.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfquery name="get_forecast" datasource="#application.datasources.main#">
SELECT forecast_id
FROM Forecast
WHERE active_ind=1
	AND forecast_month=#attributes.force_month#
	AND forecast_year=#attributes.force_year#
	AND created_by=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
</cfquery>
<cfset variables.forecast_id=get_forecast.forecast_id>
</cfsilent>
