
<!--Reports/dsp_deadline_management_chart.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Deadline Management Report chart (table).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> due_year: number containing a year
	--> due_month: number containing a month
	--> on_time_percent: decimal number that indicates the number of tasks in the given due_year and due_month that were completed on time or early.
	END FUSEDOC --->
<cfset variables.temp_year=0>
</cfsilent>
<cfoutput>
<table class="table table-striped table-bordered table-condensed table-to-chart" data-chart-type="bar" data-chart-target="deadline_management_chart">
	<caption><h3>Trend of Team's Deadline Management</h3></caption>
	<thead>
		<tr>
			<th>Year</th>
			<th>Month</th>
			<th>Percent</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="deadline_management_main">
		<tr>
			<td class="date"><cfif due_year NEQ variables.temp_year>#due_year#<cfset variables.temp_year=due_year><cfelse>&nbsp;</cfif></td>
			<td class="date graph_label"><a href="javascript:change_month('#due_month#','#due_year#');" title="View this month's details.">#monthasstring(due_month)#</a></td>
			<td class="number graph_data">#decimalformat(on_time_percent)#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>