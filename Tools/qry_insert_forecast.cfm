
<!--Tools/qry_insert_forecast.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfquery name="insert_forecast" datasource="#application.datasources.main#">
INSERT INTO Forecast (forecast_month, forecast_year, created_by)
VALUES(#attributes.force_month#, #attributes.force_year#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
RETURNING forecast_id;
</cfquery>
<cfset variables.forecast_id=insert_forecast.forecast_id>
</cfsilent>
