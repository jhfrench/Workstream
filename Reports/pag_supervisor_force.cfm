
<!--Reports/pag_supervisor_force.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the supervisor's ForcePlanner report. This report shows direct report's tasks and hours for complete and incomplete, budgeted and un-budgeted tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.from_date" default="#month(now())#/1/#year(now())#">
<cfparam name="attributes.to_date" default="#month(now())#/#daysinmonth(now())#/#year(now())#">
</cfsilent>
<cfinclude template="qry_supervisor_force.cfm">
<cfinclude template="dsp_supervisor_force.cfm">
<cfinclude template="act_force_hidden_links.cfm">

