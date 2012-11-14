
<!--Reports/dsp_manager_hours_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the manager hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
	<cfset variables.user_account_id=0>
</cfsilent>
<cfoutput>
<h1>Manager's Hours Report</h1>
<h2>from #attributes.from_date# to #attributes.through_date#</h2>
<cfif get_manager_hours_report_output.recordcount>
	<cfloop query="get_manager_hours_report_output">
		<cfif variables.user_account_id NEQ get_manager_hours_report_output.user_account_id>
			<cfset variables.user_account_id=get_manager_hours_report_output.user_account_id>
			<cfquery name="get_total_hours" dbtype="query">
			SELECT SUM(hours) AS total_hours
			FROM get_manager_hours_report_output
			WHERE user_account_id=#variables.user_account_id#
			</cfquery>
			<cfif get_manager_hours_report_output.currentrow NEQ 1>
			</tbody>
		</table>
			</cfif>
		<table class="table table-striped table-bordered table-condensed">
			<caption>
				<h3>#lname#, #name#</h3>
				<h2>Employee Type: <small>#employee_classification#</small>, Company: <small>#company#</small></h2>
			</caption>
			<thead>
				<tr>
					<th scope="row">Date</th>
					<th>Customer</th>
					<th>Notes</th>
					<th>Hours</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td>
						<td scope="row">Total Hours</td>
						<td class="number">#decimalformat(get_total_hours.total_hours)#</td>
					</td>
				</tr>
			</tfoot>
			<tbody>
		</cfif>
				<tr>
					<td class="date">#dateformat(work_date, "m/d/yyyy")#</td>
					<td>#display#</td>
					<td>#note#</td>
					<td class="number">#decimalformat(hours)#</td>
				</tr>
	</cfloop>
			</tbody>
	</table>
<cfelse>
	<div class="alert alert-info">
		You have no known subordinates during the specified dates.
	</div>
</cfif>


