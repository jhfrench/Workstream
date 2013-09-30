
<!--Customers/dsp_new_project_step2.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the second step of the 'create new project' wizard.
	||
	Name: Jeromy French
	 ||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfset variables.start=1>
<cfparam name="attributes.strip_trailing_ind" default="0" />
</cfsilent>
<cfoutput>
<cfif attributes.billable_type_id EQ 2>
	<!--- Non-Billable; by definition cannot have a budget. --->
	<input type="hidden" name="budget" id="budget" value="0" />
<cfelse>
<fieldset>
	<legend><h3>Billing Details</h3></legend>
	<div class="control-group">
		<label class="control-label" for="budget">Budget</label>
		<div class="controls">
			<div class="input-prepend">
				<span class="add-on">$</span>
				<input type="number" name="budget" id="budget" step="0.01" min="0" required="required" class="span8" />
			</div>
			<p class="help-block">Specify the total budget, in dollars, for this project.</p>
		</div>
	</div>
<cfswitch expression="#attributes.billable_type_id#">
<cfcase value="1">
	<fieldset>
		<legend>Hourly</legend>
	<div class="control-group">
		<label class="control-label" for="rate">Hourly rate</label>
		<div class="controls">
			<div class="input-prepend">
				<span class="add-on">$</span>
				<input type="number" name="rate" id="rate" step="0.01" min="0" max="9999" required="required" class="span8" />
			</div>
			<p class="help-block">Provide the default hourly rate. If necessary, you can customize the rate on a per-employee basis in the Billing_Rate table.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="start_date">Start</label>
		<div class="controls">
			<input type="date" name="start_date" id="start_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			<p class="help-block">Please enter a proper date for which billing is to begin on this project.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="end_date">End</label>
		<div class="controls">
			<input type="date" name="end_date" id="end_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			<p class="help-block">Provide the dates for which the hourly rate will be effective.</p>
		</div>
	</div>
	</fieldset>
</cfcase>
<cfcase value="3">
	<fieldset>
		<legend>Flat-Rate</legend>
	<div class="control-group">
		<label class="control-label" for="start_date">Start</label>
		<div class="controls">
			<input type="date" name="start_date" id="start_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			<p class="help-block">Please enter a proper date for which billing is to begin on this project.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="end_date">End</label>
		<div class="controls">
			<input type="date" name="end_date" id="end_date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" class="span3 date" />
			<p class="help-block">Provide the dates for which the hourly rate will be effective.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="months">Months</label>
		<div class="controls">
			<input type="number" name="months" id="months" step="1" min="0" required="required" class="span8" />
			<p class="help-block">Provide the number of months for which this project will be billed to the customer. The customer will be billed in equal increments.</p>
		</div>
	</div>
	</fieldset>
</cfcase>
<cfcase value="4">
	<fieldset>
		<legend>Per-Incident</legend>
	<div class="control-group">
		<label class="control-label" for="charge">Incident Charge</label>
		<div class="controls">
			<div class="input-prepend">
				<span class="add-on">$</span>
				<input type="number" name="charge" id="charge" step="1" min="0" max="9999" required="required" class="span8" />
			</div>
			<p class="help-block">Specify the per-incident charge that the customer will incur each time a new task is created under this project.</p>
		</div>
	</div>
	</fieldset>
</cfcase>
</cfswitch>
</fieldset>
</cfif>
<fieldset>
	<legend><h3>Work Dates</h3></legend>
	<div class="control-group">
		<label class="control-label" for="project_start">Start</label>
		<div class="controls">
			<input type="date" name="project_start" id="project_start" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			<p class="help-block">Provide the date work is to begin on the project.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="project_end">End</label>
		<div class="controls">
			<input type="date" name="project_end" id="project_end" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" class="span3 date" />
			<p class="help-block">Provide the anticipated date that work will stop.</p>
		</div>
	</div>
</fieldset>
<cfif attributes.req_custom NEQ 0>
<fieldset>
	<legend><h3>Custom Fields</h3></legend>
	<cfinclude template="dsp_user_field_input.cfm">
</fieldset>
</cfif>
	<div class="form-actions">
		<input type="hidden" name="step" value="3" />
		<input type="hidden" name="billable_type_id" value="#attributes.billable_type_id#" />
		<input type="hidden" name="business_case" value="#attributes.business_case#" />
		<cfif isdefined("attributes.company_id")><input type="hidden" name="company_id" value="#attributes.company_id#" /></cfif>
		<input type="hidden" name="customer_id" value="#attributes.customer_id#" />
		<input type="hidden" name="description" value="#attributes.description#" />
		<input type="hidden" name="mission" value="#attributes.mission#" />
		<input type="hidden" name="product_id" value="#attributes.product_id#" />
		<input type="hidden" name="req_custom" value="#attributes.req_custom#" />
		<input type="hidden" name="strip_trailing_ind" value="#attributes.strip_trailing_ind#" />
		<input type="hidden" name="vision" value="#attributes.vision#" />
		<input type="submit" value="Proceed" class="btn btn-primary" />
	</div>
</cfoutput>
