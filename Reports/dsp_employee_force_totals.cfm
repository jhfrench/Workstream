
<!--Reports/dsp_employee_force_totals.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the summary for an employee's ForcePLanner report.
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
	<caption><h3>Totals (#attributes.from_date# through #attributes.through_date#)</h3></caption>
	<thead>
		<tr>
			<th>Metric</th>
			<th>You</th>
			<th>#session.workstream_company_name#</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td scope="row">
				Average number of days assigned to complete a task
			</td>
			<td class="number">
				#decimalformat(employee_force_totals.given_days)#
			</td>
			<td class="number">
				#decimalformat(team_force_totals.given_days)#
			</td>
		</tr>
		<tr>
			<td scope="row">
				Average number of days used to complete a task
			</td>
			<td class="number">
				#decimalformat(employee_force_totals.duration_days)#
			</td>
			<td class="number">
				#decimalformat(team_force_totals.duration_days)#
			</td>
		</tr>
		<tr>
			<td scope="row">
				Percent of tasks completed on time or early
			</td>
			<td class="number">
				#decimalformat(employee_force_totals.on_time)#%
			</td>
			<td class="number">
				#decimalformat(team_force_totals.on_time)#%
			</td>
		</tr>
		<tr>
			<td scope="row">
				Percent of tasks completed on or under budget
			</td>
			<td class="number">
				#decimalformat(employee_force_totals.on_budget)#%
			</td>
			<td class="number">
				#decimalformat(team_force_totals.on_budget)#%
			</td>
		</tr>
	</tbody>
</table>
</cfoutput>
