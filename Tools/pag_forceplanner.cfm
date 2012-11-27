
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
<cfinclude template="act_forceplanner_queries.cfm">
<cfinclude template="act_forceplanner.cfm">
<cfoutput>
<h1>#session.workstream_company_name# ForcePlanner</h1>
<cfform name="form_forceplanner" action="index.cfm?fuseaction=Tools.forceplanner_save" method="POST">
	<h2>Tasks</h2>
	<cfinclude template="dsp_forceplanner_main_head.cfm">
	<cfinclude template="dsp_forceplanner_assign_rows.cfm">
	<div class="row-fluid">
		<div class="span8">
			<h2>Workload Summary</h2>
			<div class="row-fluid">
				<div class="row-fluid">
					<div class="span1"></div>
					<div class="span4">
						#variables.forceplanner_subordinates#
					</div>
					<div class="span3">Team Totals</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="row-fluid">
					<div class="span1">Assigned hours</div>
					<div class="span4">
						<div class="row-fluid">
						<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
							<cfparam name="sum_#variables.user_account_id#" default="0">
							<div class="span1 number">
								<input type="text" name="sum_#variables.user_account_id#" value="#evaluate('sum_#variables.user_account_id#')#" readonly="readonly" class="number span3" />
							</div>
						</cfloop>
						</div>
					</div>
					<div class="span1 number">
						#variables.requested_sum#
					</div>
					<div class="span1 number">
						<input type="text" name="sum_assigned" value="0" readonly="readonly" class="number span3" />
					</div>
					<div class="span1 number">
						<input type="text" name="sum_remaining" value="0" readonly="readonly" class="number span3" />
						<input type="hidden" name="force_year" value="#attributes.force_year#" />
						<input type="hidden" name="force_month" value="#attributes.force_month#" />
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="row-fluid">
					<div class="span1">Available hours</div>
					<div class="span4">
						<div class="row-fluid">
						<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
							<div class="span1 number">
								#get_week_days.hours_in_month#
							</div>
						</cfloop>
						</div>
					</div>
					<div class="span1 number">
						#variables.total_requested#
					</div>
					<div class="span1 number">
						#variables.total_requested#
					</div>
					<div class="span1 number">
						#variables.total_requested#
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="row-fluid">
					<div class="span1">Capacity Used</div>
					<div class="span4">
						<div class="row-fluid">
						<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
							<div class="span1 number">
								<input type="text" name="capacity_#variables.user_account_id#" value="#numberformat(evaluate('sum_#variables.user_account_id#')/get_week_days.hours_in_month*100,"___")#%" readonly="readonly" class="number span3" />
							</div>
						</cfloop>
						</div>
					</div>
					<div class="span1 number">
						<cfif variables.total_requested><cfset variables.total_capacity=requested_sum/variables.total_requested*100><cfelse><cfset variables.total_capacity=0></cfif>
						#decimalformat(variables.total_capacity)#%
					</div>
					<div class="span1 number">
						<input type="text" name="capacity_assigned" value="0%" readonly="readonly" class="number span3" />
					</div>
					<div class="span1 number">
						<input type="text" name="capacity_remaining" value="0%" readonly="readonly" class="number span3" />
					</div>
				</div>
			</div>
		</div>
		<div class="span4">
		<cfif variables.show_submit_button>
			<input type="reset" name="reset" value="Reload Form" class="btn" /><br />
			<input type="button" name="submit_button" value="Assign Tasks" onkeypress="document.forceplanner.submit();" onclick="document.forceplanner.submit();" class="btn btn-danger" /><br />
		</cfif>
		</div>
	</div>
</cfform>
</cfoutput>

<cfinclude template="dsp_forceplanner_title_bar.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details" target="task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_project" field_name="project_id" fuseaction="Customers.edit_project" target="edit_project">