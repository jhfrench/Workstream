
<!--Reports/dsp_efficiency_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the efficiency report for the engagement that corresponds to what the user requests (as determined by the fuseaction).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<div class="row">
	<div class="span6">
		<cfinclude template="dsp_efficiency_report_chart.cfm">
	</div>
	<div class="span6">
		Graph goes here
		<!--- <cfinclude template="dsp_efficiency_report_graph.cfm"> --->
	</div>
</div>
<div class="row">
	<div class="span9">
		<cfinclude template="dsp_efficiency_report_sub.cfm">
	</div>
</div>
</cfoutput>