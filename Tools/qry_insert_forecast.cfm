
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
INSERT INTO Forecast (forecast_month, forecast_year, approved_by)
VALUES(#attributes.force_month#, #attributes.force_year#, #variables.user_identification#);

SELECT CURRVAL('Forecast_forecast_id_SEQ') AS forecast_id;
</cfquery>
<cfset variables.forecast_id=insert_forecast.forecast_id>
</cfsilent>
