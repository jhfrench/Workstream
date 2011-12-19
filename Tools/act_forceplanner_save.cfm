
<!--Tools/act_forceplanner_save.cfm
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
<cfset variables.update_count=0>
<cftransaction isolation="read_committed">
	<cfinclude template="qry_get_last_forecast.cfm">
	<cfif get_last_forecast.recordcount GT 0>
		<cfset variables.forecast_id=get_last_forecast.forecast_id>
	<cfelse>
		<cfinclude template="qry_insert_forecast.cfm">
		<cfinclude template="qry_get_last_forecast.cfm">
		<cfset variables.forecast_id=get_last_forecast.forecast_id>
	</cfif>
</cftransaction>
<cfinclude template="qry_update_task.cfm">
<cfinclude template="qry_insert_forecast_assignment.cfm">
<cfset variables.colspan=get_subordinates.recordcount+9>
</cfsilent>

