
<!--Reports/dsp_efficiency_report_graph.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report graph.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
	<cfset dataset0yvalues=listprepend(dataset0yvalues,(efficiency_percent))>
</cfsilent>
<div id="efficiency_report_chart">
</div>