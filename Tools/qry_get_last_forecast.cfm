
<!--Tools/qry_get_last_forecast.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the forecast id that corresponds to a given month, year, and forceplanner user's emp_id.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="get_last_forecast" datasource="#application.datasources.main#">
SELECT forecast_id
FROM Forecast
WHERE active_ind=1
	AND forecast_month=#attributes.force_month#
	AND forecast_year=#attributes.force_year#
	AND approved_by=#session.user_account_id#
</cfquery>
</cfsilent>

