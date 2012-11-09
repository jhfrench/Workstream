
<!--Reports/dsp_deadline_management_sub.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Deadline Management Report that shows data per employee.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> user_account_id: number that uniquely identifies an employee
	--> lname: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> on_time: decimal number that indicates the percent of tasks an employee has completed on time or early in the specified month
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<caption><h3>Deadline Management Details for <cfoutput>#attributes.admin_month#/#attributes.admin_year#</cfoutput></h3></caption>
	<cfif deadline_management_sub.recordcount>
	<thead>
		<tr>
			<th>Team member</th>
			<th>On-Time</th>
			<th>Tasks</th>
			<th>Percent</th>
		</tr>
	</thead>
	</cfif>
	<tfoot>
		<tr>
			<td colspan="4">
				Employees who have no tasks due in #monthasstring(attributes.admin_month)# of #attributes.admin_year# will not appear in this table.
			</td>
		</tr>
	</tfoot>
	<cfif deadline_management_sub.recordcount>
	<tbody>
	<cfloop query="deadline_management_sub">
		<tr>
			<td><a href="javascript:list_to_employee('#user_account_id#')" title="View this employee's profile.">#lname#, #name#</a></td>
			<td class="number">#numberformat(on_time_count)#</td>
			<td class="number">#task_count#</td>
			<td class="number">#decimalformat(on_time_average)#</td>
		</tr>
	</cfloop>
	</tbody>
	<cfelse>
		<tr>
			<td colspan="4">
				There is no available data for this report.
			</td>
		</tr>
	</cfif>
</table>
</cfoutput>