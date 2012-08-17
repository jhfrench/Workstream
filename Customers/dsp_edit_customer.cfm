
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
			<label for="root_code">Root Code</label>
			<div class="controls">
				<input type="text" name="root_code" id="root_code" value="#customer_change.root_code#" maxlength="4" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="description">Name</label>
			<div class="controls">
				<input type="text" name="description" id="description" value="#customer_change.description#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_id">Company</label>
			<div class="controls">
				<cfselect name="company_id" id="company_id" size="1" query="get_companies" value="company_id" display="description" selected="#customer_change.company_id#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="visible_to_company_id">Visible To</label>
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
			<label for="active_ind">Active</label>
			<div class="controls">
				<select name="active_ind" id="active_ind" size="1" class="span4">
					<option value="1"<cfif customer_change.active_ind EQ 1> selected="selected"</cfif>>Active</option>
					<option value="0"<cfif customer_change.active_ind EQ 0> selected="selected"</cfif>>Inactive</option>
				</select>
			</div>
		</div>
	</fieldset>
	<fieldset>
		<legend><h3>Business Address</h3></legend>
		<div class="control-group">
			<label for="company_address1">Street</label>
			<div class="controls">
				<input type="text" name="company_address1" id="company_address1" value="#customer_change.company_address1#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_address2">Street 2</label>
			<div class="controls">
				<input type="text" name="company_address2" id="company_address2" value="#customer_change.company_address2#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_city">City</label>
			<div class="controls">
				<input type="text" name="company_city" id="company_city" value="#customer_change.company_city#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_state">State</label>
			<div class="controls">
				<cfselect name="company_state" id="company_state" size="1" query="get_states" value="state" display="state" selected="#customer_change.company_state#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_zip">Zip</label>
			<div class="controls">
				<input type="text" name="company_zip" id="company_zip" value="#customer_change.company_zip#" class="span4" />
			</div>
		</div>
	</fieldset>
	<fieldset>
		<legend><h3>Contact</h3></legend>
		<div class="control-group">
			<label for="name">First Name</label>
			<div class="controls">
				<input type="text" name="name" id="name" value="#customer_change.name#" class="span4" />
			</div>
		</div>
		<div class="control-group">
			<label for="lname">Last Name</label>
			<div class="controls">
				<input type="text" name="lname" id="lname" value="#customer_change.lname#" class="span4" />
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