 
<!--Customers/dsp_edit_project_main.cfm
	Author: Jeromy French -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the list of details that a user can edit on an project.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_project_main.cfm">
<cfinclude template="qry_get_root_codes.cfm">
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="../common_files/qry_get_link_project_company.cfm">
<cfinclude template="../common_files/qry_get_products.cfm">
<cfinclude template="../common_files/qry_get_ref_project_status.cfm">
<cfinclude template="../common_files/qry_get_ref_project_health.cfm">
<cfset variables.linked_companies=valuelist(get_link_project_company.company_id)>
<cfif len(get_project_main.last_work_date)>
	<cfset variables.min_project_start=application.application_specific_settings.workstream_start_date>
	<cfset variables.max_project_start=get_project_main.first_work_date>
	<cfset variables.min_project_end=get_project_main.last_work_date>
<cfelse>
	<cfset variables.min_project_start=application.application_specific_settings.workstream_start_date>
	<cfset variables.max_project_start=application.application_specific_settings.workstream_start_date>
	<cfset variables.min_project_end=application.application_specific_settings.workstream_start_date>
</cfif>
<cfoutput>
<cfform name="edit_project_main_form" action="index.cfm?fuseaction=Customers.edit_project" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>Edit Project for <a href="javascript:project_list('#get_customer_name_code.root_code#');" title="View other projects for this customer.">#get_customer_name_code.project_name#</a>&ndash; #get_customer_name_code.project_code#</h2></legend>
		<div class="control-group">
			<label for="customer_id" class="control-label">Root Code</label>
			<div class="controls">
				<cfselect name="customer_id" id="customer_id" size="1" query="get_root_codes" value="customer_id" selected="#get_project_main.customer_id#" required="yes" display="display"></cfselect>
			</div>
		</div>
		<div class="control-group">
			<label for="description" class="control-label">Project Name</label>
			<div class="controls">
				<cfinput type="text" name="description" id="description" value="#get_project_main.description#" required="yes" message="Please enter an Project Name" size="45" />
				<p class="help-block">Choose a unique project name.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="company_id" class="control-label">Visible To</label>
			<div class="controls">
				<select name="company_id" id="company_id" multiple="multiple" size="4">
					<cfloop query="get_companies">
						<option value="#company_id#"<cfif listcontains(variables.linked_companies,company_id)> selected="selected"</cfif>>#description#</option>
					</cfloop>
				</select>
				<p class="help-block">Specify which companies' employees should see this project.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="project_manager_id" class="control-label"><abbr title="Project Manager">PM</abbr>/Account Management</label>
			<div class="controls">
				<cfmodule template="../common_files/dsp_team_select.cfm" size="6" select_name="project_manager_id" selected_value_ind="1" user_account_id="#get_project_main.project_manager_id#">
			</div>
		</div>
		<div class="control-group">
			<label for="file_path" class="control-label">File Path</label>
			<div class="controls">
				<div class="input-append">
					<input type="text" name="file_path" id="file_path" value="#get_project_main.file_path#" class="span3">
					<a href="javascript:window.open('index.cfm?fuseaction=common_files.file_attach', 'files', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=210');" title="Associate a file path to this task." class="btn"><i class="icon-folder-open"></i> Specify</a>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label for="product_id" class="control-label">Product</label>
			<div class="controls">
				<cfselect name="product_id" id="product_id" query="get_products" value="product_id" display="product_name" selected="#get_project_main.product_id#" required="yes" message="Please choose which product this project applies to." size="4"></cfselect>
				<p class="help-block">Specify which product this project will cover.</p>
			</div>
		</div>
		<div class="control-group">
			<fieldset>
				<legend class="control-label">Status</legend>
				<div class="controls">
					<label for="active_ind_1" class="radio">
						<input type="radio" name="active_ind" id="active_ind_1" value="1" required="required"<cfif get_project_main.active_ind EQ 1> checked="checked"</cfif> />
						Active
					</label>
					<label for="active_ind_0" class="radio">
						<input type="radio" name="active_ind" id="active_ind_0" value="0" required="required"<cfif get_project_main.active_ind EQ 0> checked="checked"</cfif> />
						Inactive
					</label>
				</div>
			<fieldset>
		</div>
		<fieldset>
		<legend>Project Dates</legend>
		<div class="control-group">
			<label for="project_start" class="control-label">Start</label>
			<div class="controls">
				<input type="date" name="project_start" id="project_start" value="#dateformat(get_project_main.project_start,'yyyy-mm-dd')#" min="#dateformat(variables.min_project_start, 'yyyy-mm-dd')#" max="#dateformat(variables.max_project_start, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
				<p class="help-block">Required; please enter a proper date for which work is to begin on this project.<cfif len(get_project_main.last_work_date)> You cannot choose a date after the project's first time entry (#dateformat(get_project_main.first_work_date,'m/d/yyyy')#)</cfif></p>
				<label class="radio" for="extend_billing_rate_start_ind_1">
					<input type="radio" name="extend_billing_rate_start_ind" id="extend_billing_rate_start_ind_1" value="1" checked="checked"> Extend active billing rate start dates to match this date
				</label>
				<label class="radio" for="">
					<input type="radio" name="extend_billing_rate_start_ind" id="extend_billing_rate_start_ind_0" value="0"> Leave the billing rates alone
				</label>
			</div>
		</div>
		<div class="control-group">
			<label for="project_end" class="control-label">End</label>
			<div class="controls">
				<input type="date" name="project_end" id="project_end" value="#dateformat(get_project_main.project_end,'yyyy-mm-dd')#" min="#dateformat(min_project_end, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
				<p class="help-block">Required; date for which work is expected to end on this project.<cfif len(get_project_main.last_work_date)> You cannot choose a date earlier than the project's last time entry (#dateformat(get_project_main.last_work_date,'m/d/yyyy')#)</cfif></p>
				<label class="radio" for="extend_billing_rate_end_ind_1">
					<input type="radio" name="extend_billing_rate_end_ind" id="extend_billing_rate_end_ind_1" value="1" checked="checked"> Extend active billing rate end dates to match this date
				</label>
				<label class="radio" for="extend_billing_rate_end_ind_0">
					<input type="radio" name="extend_billing_rate_end_ind" id="extend_billing_rate_end_ind_0" value="0"> Leave the billing rates alone
				</label>
			</div>
		</div>
		<div class="control-group">
			<label for="date_go_live" class="control-label">Go Live</label>
			<div class="controls">
				<input type="date" name="date_go_live" id="date_go_live" value="#dateformat(get_project_main.date_go_live,'yyyy-mm-dd')#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" class="span3 date" />
				<p class="help-block">Optional; date project is expected to be delivered.</p>
			</div>
		</div>
		</fieldset>
		<div class="control-group">
			<label for="status" class="control-label">Health</label>
			<div class="controls">
				<cfselect name="project_health_id" id="project_health_id" query="get_ref_project_health" value="project_health_id" display="description" selected="#get_project_main.project_health_id#" class="span3" />
				<p class="help-block">What is your impression of the health of the project?</p>
			</div>
		</div>
		<div class="control-group">
			<label for="project_status_id" class="control-label">Progress</label>
			<div class="controls">
				<cfselect name="project_status_id" id="project_status_id" query="get_ref_project_status" value="project_status_id" display="description" selected="#get_project_main.project_status_id#" class="span3" />
				<p class="help-block">What is the project's current work status?</p>
			</div>
		</div>
		<div class="control-group">
			<label for="vision" class="control-label">Project Update</label>
			<div class="controls">
				<textarea name="vision" id="vision" class="span3" rows="3">#get_project_main.vision#</textarea>
				<p class="help-block">Optional</p>
			</div>
		</div>
		<div class="control-group">
			<label for="mission" class="control-label">Upselling Opportunities</label>
			<div class="controls">
				<textarea name="mission" id="mission" class="span3" rows="3">#get_project_main.mission#</textarea>
				<p class="help-block">Optional</p>
			</div>
		</div>
		<div class="control-group">
			<label for="business_case" class="control-label">Other Notes</label>
			<div class="controls">
				<textarea name="business_case" id="business_case" class="span3" rows="3">#get_project_main.business_case#</textarea>
				<p class="help-block">Optional</p>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="project_id" value="#attributes.project_id#" />
			<input type="hidden" name="option" value="1" />
			<input type="hidden" name="edit" value="1" />
			<input type="hidden" name="project_dashboard_return_ind" value="#attributes.project_dashboard_return_ind#" />
			<input type="submit" value="Proceed" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>
