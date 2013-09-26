
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
<table class="table table-striped table-bordered table-condensed tablesorter">
	<caption><h2><cfif listcontains(attributes.user_account_id,"all")>Manager </cfif> Personal Time Off Report</h2></caption>
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
				#decimalformat(get_pto_hours_summary.pto_used_hours)#
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
				<a href="javascript:pto('#user_account_id#')">#user_account_id#</a>
			</td>
			<td>
				#last_name#, #first_name#
			</td>
			<td class="number">
				#decimalformat(pto_used_hours)#
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