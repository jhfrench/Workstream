
<!--Customers/dsp_new_project_step1.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the first step of the 'create new project' wizard.
	||
	Name: Jeromy French
	 ||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_root_codes.cfm">
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="../common_files/qry_get_ref_billable_type.cfm">
<cfinclude template="../common_files/qry_get_products.cfm">
<cfoutput>
	<div class="control-group">
		<label class="control-label" for="customer_id">Root Code</label>
		<div class="controls">
			<cfselect name="customer_id" id="customer_id" size="1" query="get_root_codes" value="customer_id" required="yes" display="display" class="span9"></cfselect>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="description">Project Name</label>
		<div class="controls">
			<cfinput type="text" name="description" id="description" required="yes" message="Please enter an Project Name" class="span9" />
			<p class="help-block">Be sure to use a unique name.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="company_id">Visible To</label>
		<div class="controls">
			<cfselect name="company_id" id="company_id" query="get_companies" value="company_id" display="description" size="4" required="yes" message="Please specify which companies should see this project." multiple="yes" class="span9"></cfselect>
			<p class="help-block">Specify which companies' employees should see this project.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="product_id">Product</label>
		<div class="controls">
			<cfselect name="product_id" id="product_id" query="get_products" value="product_id" display="product_name" required="yes" message="Please choose which product this project applies to." size="4" class="span9"></cfselect>
			<p class="help-block">Which product will this new project primarily provide?</p>
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<label class="checkbox" for="strip_trailing_ind">
				<input type="checkbox" name="strip_trailing_ind" id="strip_trailing_ind" value="1"> Strip trailing digits
			</label>
			<p class="help-block"></p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">Custom Fields</label>
		<div class="controls">
			<label class="radio" for="req_custom1">
				<cfinput type="radio" name="req_custom" id="req_custom1" value="1" />Yes&ndash;this project will use custom fields
			</label>
			<label class="radio" for="req_custom0">
				<cfinput type="radio" name="req_custom" id="req_custom0" value="0" checked="yes" />No&ndash;custom fields are not necessary
			</label>
			<p class="help-block">Choose "yes" if the project will require any custom data entry.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="billable_type_id">Billing Type</label>
		<div class="controls">
			<cfloop query="get_ref_billable_type">
				<label for="billable_type_id_#billable_type_id#" class="radio">
					<input type="radio" name="billable_type_id" id="billable_type_id_#billable_type_id#" value="#billable_type_id#" required="required" /> #description#&ndash;#definition#
				</label>
			</cfloop>
			<p class="help-block">
				Choose the billing structure for this project.
			</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="vision">Project Update</label>
		<div class="controls">
			<textarea name="vision" id="vision" wrap="soft" rows="3" class="span9"></textarea>
			<p class="help-block">Optional, but helps clarify the use of the new engagment.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="mission">Upselling Opportunities</label>
		<div class="controls">
			<textarea name="mission" id="mission" wrap="soft" rows="3" class="span9" name="mission"></textarea>
			<p class="help-block">Optional, but helps clarify the use of the new engagment.</p>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="business_case">Business Case</label>
		<div class="controls">
			<textarea name="business_case" id="business_case" wrap="soft" rows="3" class="span9"></textarea>
			<p class="help-block">Optional, but helps clarify the use of the new engagment.</p>
		</div>
	</div>
	<div class="form-actions">
		<input type="hidden" name="step" value="2" />
		<input type="submit" value="Proceed" class="btn btn-primary" />
	</div>
</cfoutput>
