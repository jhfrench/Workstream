
<!--Tools/pag_forceplanner.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfparam name="attributes.force_month" default="#month(now())#">
<cfparam name="attributes.force_year" default="#year(now())#">
<cfset variables.show_submit_button=1>
</cfsilent>
<cfif isdefined("attributes.sum_assigned")>
	<cfinclude template="act_forceplanner_save.cfm">
</cfif>
<cfinclude template="act_forceplanner_queries.cfm">
<cfinclude template="act_forceplanner.cfm">
<cfoutput>
<h1>#session.workstream_company_name# ForcePlanner</h1>
<form name="form_forceplanner" id="form_forceplanner" action="index.cfm?fuseaction=Tools.forceplanner_save" method="POST">
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Tasks</h2></caption>
	<cfinclude template="dsp_forceplanner_main_head.cfm">
	<cfinclude template="dsp_forceplanner_assign_rows.cfm">
</table>
<div class="row-fluid">
	<div class="span8 offset4">
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
					<td class="number">
						#variables.requested_sum#
					</td>
					<td class="number">
						<span id="display_sum_assigned">0</span>
					</td>
					<td class="number">
						<span id="display_sum_remaining">0</span>
					</td>
				</tr>
				<tr>
					<td scope="row">Available hours</td>
				<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
					<td class="number">
						#get_week_days.hours_in_month#
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
				<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
					<td class="number">
						<span id="capacity_#variables.user_account_id#">#numberformat(evaluate('sum_#variables.user_account_id#')/get_week_days.hours_in_month*100,"___")#</span>%
					</td>
				</cfloop>
					<td class="number">
						<cfif variables.total_requested><cfset variables.total_capacity=variables.requested_sum/variables.total_requested*100><cfelse><cfset variables.total_capacity=0></cfif>
						#decimalformat(variables.total_capacity)#%
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
<cfif variables.show_submit_button>
	<input type="hidden" name="force_month" value="#attributes.force_month#" />
	<input type="hidden" name="force_year" value="#attributes.force_year#" />
	<input type="hidden" name="prospective_tasks" value="#variables.prospectives_task_id#" />
	<input type="hidden" name="sum_assigned" id="sum_assigned" value="0" />
	<input type="button" name="submit_button" value="Assign Tasks" onkeypress="document.forceplanner.submit();" onclick="document.forceplanner.submit();" class="btn btn-danger" />
	<input type="reset" name="reset" value="Reload Form" class="btn" />
</cfif>
</form>
</cfoutput>

<cfinclude template="dsp_forceplanner_title_bar.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details" target="task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_project" field_name="project_id" fuseaction="Customers.edit_project" target="edit_project">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="user_account_id" fuseaction="Directory.employee_details" target="employee_details">