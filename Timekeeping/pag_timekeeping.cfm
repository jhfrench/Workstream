
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
<cfinclude template="act_pto_blurb.cfm">
<cfinclude template="act_life_blurb.cfm">
<cfinclude template="act_hours_blurb.cfm">
<cfinclude template="../common_files/qry_get_revenue_goal.cfm">
<cfinclude template="qry_operations_blurb.cfm">
<cfinclude template="dsp_timekeeping_columns.cfm">