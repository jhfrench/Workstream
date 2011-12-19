
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
	Revision 1.0  2005/02/15 21:00:51  daugherty
	Initial revision

	Revision 1.3  2001-11-28 13:48:15-05  french
	Placed queries into their own templates. Also made change to the way force_month and year are used.

	Revision 1.2  2001-11-15 10:12:57-05  long
	Changed the isolation level from Serializable to read_committed
	
	Revision 1.1  2001-10-11 10:54:28-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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

