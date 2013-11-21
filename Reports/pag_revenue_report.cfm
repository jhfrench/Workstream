
<!--Reports/pag_revenue_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_revenue_report.cfm">
<div class="row-fluid">
	<div class="span9">
		<cfinclude template="dsp_revenue_report_chart.cfm">
	</div>
	<div class="span3">
		<!--- $issue$: needs canvas graphs --->
		<!--- stacked bar chart of revenue by month/year --->
		<!--- pie graph of revenue by type --->
		<cfinclude template="dsp_revenue_report_graph.cfm">
	</div>
</div>