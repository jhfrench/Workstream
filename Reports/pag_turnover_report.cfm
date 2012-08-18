

<!--reports/pag_turnover_report.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a graph and a table that illustrate the turnover metrics for a given company.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_get_ref_turnover_reason.cfm">
<cfinclude template="qry_get_turnover_report.cfm">
<div class="row-fluid">
	<div class="span6">
		<cfinclude template="dsp_turnover_chart.cfm">
	</div>
	<div class="span6">
		<cfinclude template="dsp_turnover_graph.cfm">
	</div>
</div>