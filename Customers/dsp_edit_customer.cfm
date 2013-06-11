
<!--Customers/dsp_edit_customer.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I hold the fuses and logic for the edit customer function.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<cfform name="form_edit_customer" action="index.cfm?fuseaction=Customers.update_customers" method="POST"class="form-horizontal">
	<fieldset>
		<legend><h2>Edit Customer</h2></legend>
	<fieldset>
		<legend><h3>General</h3></legend>
		<div class="control-group">
			<label for="root_code" class="control-label">Root Code</label>
			<div class="controls">
				<input type="text" name="root_code" id="root_code" value="#get_customer_details.root_code#" maxlength="4" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="description" class="control-label">Name</label>
			<div class="controls">
				<input type="text" name="description" id="description" value="#get_customer_details.description#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_id" class="control-label">Company</label>
			<div class="controls">
				<cfselect name="company_id" id="company_id" size="1" query="get_companies" value="company_id" display="description" selected="#get_customer_details.company_id#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="visible_to_company_id" class="control-label">Visible To</label>
			<div class="controls">
				<cfselect name="visible_to_company_id" id="visible_to_company_id" size="3" multiple="yes" required="yes" message="You must select a company to be visible to." class="span4">
					<cfloop query="get_companies">
						<option value="#company_id#"<cfif listfind(variables.visible_to_company_id,company_id)> selected="selected"</cfif>>#description#</option>
					</cfloop>
				</cfselect>
				<p class="help-block">Specify one or more companies that have a relationship with this customer.</p>
			</div>
		</div>
		<div class="control-group">
		<fieldset>
			<legend class="control-label">Status</legend>
			<div class="controls">
				<label for="active_ind_1" class="radio">
					<input type="radio" name="active_ind" id="active_ind_1" value="1" required="required"<cfif get_customer_details.active_ind EQ 1> checked="checked"</cfif> />
					Active
				</label>
				<label for="active_ind_0" class="radio">
					<input type="radio" name="active_ind" id="active_ind_0" value="0" required="required"<cfif get_customer_details.active_ind EQ 0> checked="checked"</cfif> />
					Inactive
				</label>
			</div>
		<fieldset>
		</div>
	</fieldset>
	<fieldset>
		<legend><h3>Business Address</h3></legend>
		<div class="control-group">
			<label for="company_address1" class="control-label">Street</label>
			<div class="controls">
				<input type="text" name="company_address1" id="company_address1" value="#get_customer_details.company_address1#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_address2" class="control-label">Street 2</label>
			<div class="controls">
				<input type="text" name="company_address2" id="company_address2" value="#get_customer_details.company_address2#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_city" class="control-label">City</label>
			<div class="controls">
				<input type="text" name="company_city" id="company_city" value="#get_customer_details.company_city#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_state" class="control-label">State</label>
			<div class="controls">
				<cfselect name="company_state" id="company_state" size="1" query="get_states" value="state" display="state" selected="#get_customer_details.company_state#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_zip" class="control-label">Zip</label>
			<div class="controls">
				<input type="text" name="company_zip" id="company_zip" value="#get_customer_details.company_zip#" class="span4" />
			</div>
		</div>
	</fieldset>
	<fieldset>
		<legend><h3>Contact</h3></legend>
		<div class="control-group">
			<label for="first_name" class="control-label">First Name</label>
			<div class="controls">
				<input type="text" name="first_name" id="first_name" value="#get_customer_details.first_name#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="last_name" class="control-label">Last Name</label>
			<div class="controls">
				<input type="text" name="last_name" id="last_name" value="#get_customer_details.last_name#" class="span4" />
			</div>
		</div>
	</fieldset>
		<div class="form-actions">
			<input type="hidden" name="customer_id" value="#attributes.customer_id#" />
			<input type="submit" name="submit" value="Save Changes" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>