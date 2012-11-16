
<!--Reports/dsp_employee_force_chart.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the employee's ForcePlanner report.
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
	<caption><h2>ForcePlanner Report for #get_demographics.first_name# #get_demographics.last_name#</h2></caption>
	<thead>
		<tr>
			<th>
				Project
			</th>
			<th>
				Task
			</th>
			<th>
				Billable Type
			</th>
			<th>
				Priority
			</th>
			<th>
				Status
			</th>
			<th>
				Date Due
			</th>
			<th>
				Date Completed
			</th>
			<th>
				Worked
			</th>
			<th>
				Budget
			</th>
			<th>
				Percent
			</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="employee_force">
		<tr>
			<td>
				#project#
			</td>
			<td scope="row">
				<a href="javascript:list_to_task(#task_id#);">#task#</a>
			</td>
			<td>
				#billable#
			</td>
			<td>
				#priority#
			</td>
			<td>
				#status#
			</td>
			<td class="date">
				#dateformat(due_date,"m/d/yyyy")#
			</td>
			<td class="date">
				#dateformat(complete_date,"m/d/yyyy")#
			</td>
			<td class="number">
				<span<cfif on_budget EQ 0> class="text-error"</cfif>>#decimalformat(used_hours)#</span>
			</td>
			<td class="number">
				<span<cfif on_budget EQ 0> class="text-error"</cfif>>#decimalformat(budgeted_hours)#</span>
			</td>
			<td class="number">
				<span<cfif on_budget EQ 0> class="text-error"</cfif>>#numberformat(budget_used)#%</span>
			</td>
		</tr>
	</cfloop>
	<tbody>
</table>
</cfoutput>
