
<!--Reports/dsp_pto_details_table.cfm
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
<table class="table table-striped table-bordered table-condensed">
	<caption><h2><cfif listcontains(attributes.emp_id,"all")>Manager </cfif> Personal Time Off Report</h2></caption>
	<thead>
		<tr>
			<th>Employee ID</th>
			<th>Name</th>
			<th>Hours Taken</th>
			<th>Hours Earned</th>
			<th>Hours Remaining</th>
		</tr>
	</thead>
	<tfoot>
	<cfoutput>
		<tr>
			<td colspan="2">
				&nbsp;
			</td>
			<td class="number">
				#decimalformat(get_pto_hours_summary.pto_hours_used)#
			</td>
			<td class="number">
				#decimalformat(get_pto_hours_summary.pto_hours_earned)#
			</td>
			<td class="number">
				#decimalformat(get_pto_hours_summary.remain)#
			</td> 
		</tr>
	</cfoutput>
	</tfoot>
	<tbody>
	<cfoutput query="pto_hours">
		<tr>
			<td class="number">
				<a href="javascript:pto('#emp_id#')">#emp_id#</a>
			</td>
			<td>
				#lname#, #name#
			</td>
			<td class="number">
				#decimalformat(pto_hours_used)#
			</td>
			<td class="number">
				#decimalformat(pto_hours_earned)#
			</td>
			<td class="number">
				#decimalformat(remain)#
			</td> 
		</tr>
	</cfoutput>
	</tbody>
</table>