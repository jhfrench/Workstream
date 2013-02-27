
<!--Customers/dsp_edit_project_billing.cfm
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
<cfparam name="attributes.customer_id" default="0">
<cfparam name="project_dashboard_return_ind" default="0">
<cfparam name="project_manager_id_filter" default="All">
<cfparam name="sort" default="Customer.description, Project.description">
</cfsilent>
<cfinclude template="qry_get_project_main.cfm">
<cfinclude template="../common_files/qry_get_ref_billable_type.cfm">
<cfoutput>
<cfform name="edit_project_main" action="index.cfm?fuseaction=Customers.edit_project" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>Edit Project for <a href="javascript:project_list('#get_customer_name_code.root_code#');" title="View other projects for this customer.">#get_customer_name_code.project_name#</a>&ndash; #get_customer_name_code.project_code#</h2></legend>
		<div class="control-group">
			<br />
			<label for="billable_type_id" class="control-label">Billing Type</label>
			<div class="controls">
				<cfselect name="billable_type_id" id="billable_type_id" size="4" query="get_ref_billable_type" value="billable_type_id" display="description" selected="#get_project_main.billable_type_id#" onchange="javascript:submit();" required="yes" message="Please specify the billing type for this project." class="span3"></cfselect>
			</div>
		</div>
		<div class="control-group">
			<label for="budget" class="control-label">Budget</label>
			<div class="controls">
				<div class="input-prepend input-append">
					<span class="add-on">$</span><input type="number" name="budget" id="budget" value="#get_project_main.budget#" step="1" min="0" required="required" class="span3 number" /><span class="add-on">.00</span>
				</div>
				<p class="help-block">Specify the total budget, in dollars, for this project.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="loe" class="control-label"><abbr title="Level of Effort">LOE</abbr></label>
			<div class="controls">
				<input type="number" name="loe" id="loe" value="#get_project_main.loe#" step="0.25" min="0" required="required" class="span3 number" />
				<p class="help-block">How many hours are estimated to complete this task?</p>
			</div>
		</div>
<cfswitch expression="#get_project_main.billable_type_id#">
	<cfcase value="1">
		<!--- $issue$: where is hourly? --->
	</cfcase>
	<cfcase value="3">
		<cfinclude template="qry_get_flat_rate.cfm">
		<div class="control-group">
			<label for="start_date" class="control-label">Start</label>
			<div class="controls">
				<input type="date" name="start_date" id="start_date" value="#dateformat(get_flat_rate.rate_start_date,'yyyy-mm-dd')#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
				<p class="help-block"></p>
			</div>
		</div>
		<div class="control-group">
			<label for="end_date" class="control-label">End</label>
			<div class="controls">
				<input type="date" name="end_date" id="end_date" value="#dateformat(get_flat_rate.rate_end_date,'yyyy-mm-dd')#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
				<p class="help-block"></p>
			</div>
		</div>
	</cfcase>
	<cfcase value="4">
		<cfinclude template="qry_get_incident_charge.cfm">
		<div class="control-group">
			<label for="charge" class="control-label">Incident Charge</label>
			<div class="controls">
				<div class="input-prepend input-append">
					<span class="add-on">$</span><input type="number" name="charge" id="charge" value="#decimalformat(get_incident_charge.charge)#" step="1" min="0" max="9999" required="required" class="span3 number" /><span class="add-on">.00</span>
				</div>
				<p class="help-block">Specify the per-incident charge that the customer will incur each time a new task is created under this project.</p>
			</div>
		</div>
	</cfcase>
</cfswitch>
		<div class="form-actions">
			<input type="hidden" name="project_id" value="#attributes.project_id#" />
			<input type="hidden" name="option" value="2" />
			<input type="hidden" name="edit" value="1" />
			<input type="hidden" name="original_billable_type_id" value="#get_project_main.billable_type_id#" />
			<input type="hidden" name="project_dashboard_return_ind" value="#attributes.project_dashboard_return_ind#" />
			<input type="hidden" name="customer_id" value="#attributes.customer_id#" />
			<input type="hidden" name="project_manager_id_FIlter" value="#project_manager_id_Filter#" />
			<input type="hidden" name="Sort" value="#sort#" />
			<input type="submit" value="Proceed" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>
