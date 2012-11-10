
<!--Reports/dsp_hours_by_code.cfm
	Author: Jeromy F -->
	<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>

<cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<caption>
		<h2>#attributes.report_name#</h2>
		<h3>for #attributes.from_date#&nbsp;through&nbsp;#attributes.through_date#</h3>
	</caption>
	<thead>
		<tr>
			<th>Employee Classification</th>
			<th>Project</th>
			<th>Hours</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th colspan="2">Total Hours</th>
			<td class="number">#get_hours_by_code_totals.hours_total#</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_hours_by_code">
		<tr>
			<td>#employee_classification#</td>
			<td>#clientname#</td>
			<td class="number">#hours#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>