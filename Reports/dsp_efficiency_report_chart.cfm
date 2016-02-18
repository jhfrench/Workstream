
<!--Reports/dsp_efficiency_report_chart.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report chart (table).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<table class="table table-striped table-bordered table-condensed table-to-chart" data-chart-type="bar" data-chart-target="efficiency_report_chart">
	<caption>
		<h3>Percent of #variables.project_name# Time <small>#variables.project_name# Time</small></h3>
	</caption>
	<thead>
		<tr>
			<th>Month</th>
			<th>Hours</th>
			<th>%</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="efficiency_report_main">
	<cfif time_year LT variables.lowest_year><cfset lowest_year=time_year></cfif>
		<tr>
			<td class="date graph_label"><cfif time_year NEQ variables.temp_year>#time_year#<cfset variables.temp_year=time_year></cfif> <a href="javascript:change_month('#time_month#','#time_year#');">#monthasstring(time_month)#</a></td>
			<td class="number">#decimalformat(efficiency_time)#</td>
			<td class="number graph_data">#decimalformat(efficiency_percent)#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>