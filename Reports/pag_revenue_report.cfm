
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
	<div class="span6">
		<cfinclude template="dsp_revenue_report_chart.cfm">
	</div>
	<div class="span6">
		<cfif revisedrecordcount>
			<cfinclude template="dsp_revenue_report_graph.cfm">
		</cfif>
	</div>
</div>