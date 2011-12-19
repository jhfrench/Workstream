
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
	Revision 1.0  2005/02/15 21:02:07  daugherty
	Initial revision

	Revision 1.0  2001-11-28 13:49:11-05  french
	Initial file creation.

	||
 --->
<cfquery name="get_last_forecast" datasource="#application.datasources.main#">
SELECT forecast_id
FROM Forecast
WHERE forecast_month=#attributes.force_month#
	AND forecast_year=#attributes.force_year#
	AND approved_by=#session.user_account_id#
</cfquery>
</cfsilent>

