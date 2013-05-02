
<!--Tools/dsp_forceplanner_summary.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the rows that allow the user to assign task hours to team members.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfoutput>
<div class="row-fluid">
	<div class="span9 offset3">
		<table class="table table-striped table-bordered table-condensed">
			<caption><h2>Workload Summary</h2></caption>
			<thead>
				<tr>
					<th>Team Totals</th>
					#variables.forceplanner_subordinates#
					<th class="requested_hours" title="Requested hours">Requested</th>
					<th class="assigned_hours" title="Assigned hours">Assigned</th>
					<th class="remaining_hours" title="Remaining hours">Remaining</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">Assigned hours</td>
				<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
					<td class="number">
						<span id="sum_#variables.user_account_id#" class="employee_sum">#evaluate('sum_#variables.user_account_id#')#</span>
					</td>
				</cfloop>
					<td id="display_sum_requested" class="number">
						#variables.requested_sum#
					</td>
					<td id="display_sum_assigned" class="number">
						0
					</td>
					<td id="display_sum_remaining" class="number">
						0
					</td>
				</tr>
				<tr>
					<td scope="row">Available hours</td>
				<cfloop query="get_week_days">
					<td class="number">
						#capacity#
					</td>
				</cfloop>
					<td class="number">
						#variables.total_requested#
					</td>
					<td class="number">
						#variables.total_requested#
					</td>
					<td class="number">
						#variables.total_requested#
					</td>
				</tr>
				<tr>
					<td scope="row">Capacity Used</td>
				<cfloop query="get_week_days">
					<td class="number">
						<span id="capacity_#variables.user_account_id#">#numberformat(evaluate('sum_#user_account_id#')/capacity*100,"___")#</span>%
					</td>
				</cfloop>
					<td class="number">
						<cfif variables.total_requested><cfset variables.total_capacity=variables.requested_sum/variables.total_requested*100><cfelse><cfset variables.total_capacity=0></cfif>
						<span id="capacity_requested">#decimalformat(variables.total_capacity)#</span>%
					</td>
					<td class="number">
						<span id="capacity_assigned">0</span>%
					</td>
					<td class="number">
						<span id="capacity_remaining">0</span>%
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</cfoutput>