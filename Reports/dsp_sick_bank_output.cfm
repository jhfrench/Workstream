
<!--Reports/dsp_sick_bank_output.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the Sick Bank report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<table class="table table-striped table-bordered table-condensed">
	<caption>Sick Bank Report</caption>
	<thead>
		<tr>
			<th>Employee</th>
			<th>Hours Granted</th>
			<th>Hours Used</th>
			<th>Hours Remaining</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_sick_bank">
		<tr>
			<td>#last_name#, #first_name#</td>
			<td class="number">#decimalformat(granted_hours)#</td>
			<td class="number">#decimalformat(used_hours)#</td>
			<td class="number">#decimalformat(remaining_hours)#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
