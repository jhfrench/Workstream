
<!--Reports/dsp_new_engage_chart.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display new engagements by customer and month.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.temp_year=0>
</cfsilent>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>New Project Report</h2></caption>
<cfif new_engage_output.recordcount>
	<thead>
		<tr>
			<th>Year</th>
			<th>Month</th>
			<th>Customer</th>
			<th>Projects</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="new_engage_output">
		<tr>
			<td class="number">
				<cfif year_entered NEQ variables.temp_year>#year_entered#<cfelse>&nbsp;</cfif>
			</td>
			<td>
				#monthasstring(month_entered)#
			</td>
			<td>
				#customer_name#
			</td>
			<td class="number">
				#numberformat(engagement_count)#
			</td>
			<cfset variables.temp_year=year_entered>
		</tr>
	</cfoutput>
	</tbody>
<cfelse>
		<tr>
			<td>No records match your criteria</td>
		</tr>
</cfif>
</table>
