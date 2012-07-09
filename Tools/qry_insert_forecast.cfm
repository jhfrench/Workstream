
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
VALUES(#attributes.force_month#, #attributes.force_year#, #session.user_account_id#)
</cfquery>
</cfsilent>

