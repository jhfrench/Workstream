
<!--Timekeeping/pag_timekeeping.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main timekeeping page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<cfif session.account_type_id EQ 1>
	<cfinclude template="act_pto_blurb.cfm">
	<cfinclude template="act_life_blurb.cfm">
<cfelse>
	<!--- $issue$: queries that support latest/remaining/unbilled work will go here --->
</cfif>
<cfinclude template="act_hours_blurb.cfm">
<cfinclude template="../common_files/qry_get_revenue_goal.cfm">
<cfinclude template="qry_get_operations_blurb.cfm">
<cfinclude template="dsp_timekeeping_columns.cfm">