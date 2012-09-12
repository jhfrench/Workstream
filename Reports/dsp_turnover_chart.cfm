
<!--Reports/dsp_turnover_chart.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the table rows/data for the turnover report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Turnover Report</h2></caption>
	<cfif get_turnover_report.recordcount>
	<tfoot>
		<tr>
			<td>Between #year(application.application_specific_settings.workstream_start_date)# Q#datepart("Q", application.application_specific_settings.workstream_start_date)# and #year(now())# Q#datepart("Q", now())#</td>
			<td class="number">#get_total_population.total_population#</td>
			<cfloop query="get_ref_turnover_reason">
			<cfset variables.turnover_count=evaluate("get_turnover_report_total.turnover_reason_id_#turnover_reason_id#")>
			<td class="number">#variables.turnover_count#</td>
			<td class="number">#decimalformat(variables.turnover_count/get_total_population.total_population*100)#%</td>
			</cfloop>
		</tr>
	</tfoot>
	<thead>
		<tr>
			<th rowspan="2">Quarter</th>
			<th rowspan="2">Employees</th>
			<cfloop query="get_ref_turnover_reason">
			<th colspan="2" title="#note#">#description#</th>
			</cfloop>
		</tr>
		<tr>
			<cfloop query="get_ref_turnover_reason">
			<th>Count</th>
			<th>Percent</th>
			</cfloop>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_turnover_report">
		<tr>
			<td>#date_year# Q#date_quarter#</td>
			<td class="number">#population_count#</td>
			<cfloop query="get_ref_turnover_reason">
			<cfset variables.turnover_count=evaluate("get_turnover_report.turnover_reason_id_#turnover_reason_id#")>
			<td class="number">#variables.turnover_count#</td>
			<td class="number">#decimalformat(variables.turnover_count/get_turnover_report.population_count*100)#%</td>
			</cfloop>
		</tr>
	</cfloop>
	</tbody>
	<cfelse>
		<tr>
			<td>You have no turnover data entered.</td>
		</tr>
	</cfif>
</table>
</cfoutput>