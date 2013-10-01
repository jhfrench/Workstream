
<!--Timekeeping/dsp_timekeeping_columns.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main timekeeping page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>

<cfoutput>
		<div class="row-fluid">
		<cfif session.account_type_id EQ 1>
			<section id="blurb_PTO" class="span3">
				<h2><abbr title="Paid Time Off">PTO</abbr></h2>
				<p>#variables.pto_blurb#</p>
				<p><a href="index.cfm?fuseaction=Reports.#variables.pto_action#" class="btn">View details &raquo;</a></p>
			</section>
			<section id="blurb_life" class="span3">
				<h2>#listlast(session.workstream_company_name)# Life</h2>
				<p>#variables.life_blurb#</p>
				<cfif listcontains(variables.allowed_business_function_id,665)>
					<p><a href="index.cfm?fuseaction=Reports.anniversary" class="btn">View details &raquo;</a></p>
				</cfif>
			</section>
			<section id="blurb_hours" class="span3">
				<h2>Hours Worked</h2>
				#variables.hours_blurb#
				<cfif listcontains(variables.allowed_business_function_id,675)>
					<p><a href="index.cfm?fuseaction=Reports.individual_hours_summary" class="btn">View details &raquo;</a></p>
				</cfif>
			</section>
			<section id="blurb_revenue" class="span3">
				<h2>Revenue Goal</h2>
				<cfinclude template="dsp_revenue_progress.cfm">
				<cfif listcontains(variables.allowed_business_function_id,648)>
					<p><a href="index.cfm?fuseaction=Reports.revenue_report" class="btn">View details &raquo;</a></p>
				</cfif>
			</section>
		<cfelse>
			<section id="blurb_latest_work" class="span6">
				<table id="latest_work_table" class="table table-striped table-bordered table-condensed">
					<caption><h2>Latest Work</h2></caption>
					<thead>
						<tr>
							<th>Task <abbr title="Identifier">ID</abbr></th>
							<th>Date</th>
							<th>Note</th>
							<th>Hours</th>
							<th>Employee</th>
						</tr>
					</thead>
					<tbody>
					<cfoutput query="get_most_recent_relevant_time_entry">
						<tr>
							<td scope="row"><a href="javascript:list_to_task('#task_id#');" title="View details for this task.">#task_id#</a></td>
							<td class="date">#dateformat(work_date, "m/d/yyyy")#</td>
							<td>#note#</td>
							<td class="number">#numberformat(hours)#</td>
							<td class="hidden-phone hidden-tablet"><abbr title="#last_name#, #last_name#">#first_name#</abbr></td>
						</tr>
					</cfoutput>
					</tbody>
				</table>
				<cfif get_most_recent_relevant_time_entry.recordcount>
					<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
				</cfif>
			</section>
			<section id="blurb_remaining_work" class="span3">
				<h2>Remaining Work</h2>
				<p>Coming soon: breakdown of hours remaining, projected over the months remaining between now and when the tasks are due</p>
				<p><a href="##" class="btn">View details &raquo;</a></p>
			</section>
			<section id="blurb_unbilled_work" class="span3">
				<h2>Projected Bill</h2>
				<p>Coming soon: Unbilled work to date, with a projection to the end of the month.</p>
				<p><a href="##" class="btn">View details &raquo;</a></p>
			</section>
		</cfif>
		</div>
		<div class="row-fluid">
		<cfif get_operations_blurb.recordcount>
			<cfinclude template="dsp_operations_blurb.cfm">
		</cfif>
		<cfinclude template="dsp_time_allocation_chart.cfm">
		</div>
</cfoutput>