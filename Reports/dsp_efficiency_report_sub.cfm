
<!--Reports/dsp_efficiency_report_sub.cfm
	Author: Jeromy F  -->
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
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Team member</th>
			<th>Hours</th>
			<th>%</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="efficiency_report_sub">
		<tr>
			<td scope="row"><a href="javascript:list_to_employee('#emp_id#')">#lname#, #name#</a></td>
			<td class="number">#decimalformat(efficiency_hours)#</td>
			<td class="number">#decimalformat(efficiency_percent)#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>