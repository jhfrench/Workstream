
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
	<cfinclude template="qry_get_forecast.cfm">
	<cfif get_forecast.recordcount EQ 0>
		<cfinclude template="qry_insert_forecast.cfm">
	</cfif>
<cfinclude template="qry_update_task.cfm">
<cfinclude template="qry_insert_forecast_assignment.cfm">
</cftransaction>
</cfsilent>