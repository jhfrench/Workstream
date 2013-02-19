
<!--Customers/pag_new_customer.cfm
	Author: Jeromy F -->
	<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I show the form for adding a new customer.
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
	</cfsilent>
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="../common_files/qry_get_states.cfm">

<cfform id"new_customer" action="index.cfm?fuseaction=Customers.add_customer" method="POST" class="form-horizontal">
<fieldset>
	<legend><h2>Create New Customer</h2></legend>
	<fieldset>
		<legend>Customer Information</legend>
		<div class="control-group">
			<label for="description" class="control-label">Name</label>
			<div class="controls">
				<cfinput type="text" name="description" id="description" required="yes" message="Please enter a root code" class="span3" />
			</div>
		</div>
		<div class="control-group">
			<label for="root_code" class="control-label">Root Code</label>
			<div class="controls">
				<div id="code_options">
					<a href="javascript:void(0);" onclick="javascript:('#root_code_entry').show();('#code_options').hide();">Specify A Root Code</a>
				</div>
				<div id="root_code_entry" style="display:none;">
					<input type="text" name="root_code" id="root_code" size="4" class="span3" />
					<p class="help-block">If you select a root code yourself, make sure that it isn't used already.</p>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label for="company_id" class="control-label">Company</label>
			<div class="controls">
				<cfselect name="company_id" id="company_id" query="get_companies" value="company_id" display="description" selected="#session.workstream_company_name#" message="Please Select a Company" required="yes" size="1" class="span5"></cfselect>
			</div>
		</div>
		<div class="control-group">
			<label for="visible_to" class="control-label">Visible To</label>
			<div class="controls">
				<cfselect name="visible_to" id="visible_to" query="get_companies" value="company_id" display="description" required="no" message="Please Select a Company" size="6" multiple="yes" class="span5"></cfselect>
				<p class="help-block">This new customer will be visible to the employees of the specified companies.</p>
			</div>
		</div>
		<div class="control-group">
			<span class="control-label">Billable</span>
			<div class="controls">
				<label class="radio"><input type="radio" name="billable_type_id" id="billable_type_id_1" value="1" selected="selected" />Yes</label><br />
				<label class="radio"><input type="radio" name="billable_type_id" id="billable_type_id_2" value="2" />No</label>
				<p class="help-block">Will work for this customer be billable?</p>
			</div>
		</div>
	</fieldset>
	<fieldset>
		<legend>Contact Information</legend>
		<div class="control-group">
			<label for="first_name" class="control-label">First Name</label>
			<div class="controls">
				<input type="text" name="first_name" id="first_name" class="span5" />
				<p class="help-block">Our main point-of-contact for this customer</p>
			</div>
		</div>
		<div class="control-group">
			<label for="last_name" class="control-label">Last Name</label>
			<div class="controls">
				<input type="text" name="last_name" id="last_name" class="span5" />
			</div>
		</div>
		<div class="control-group">
			<label for="phone" class="control-label">Phone</label>
			<div class="controls">
				<cfinput type="text" name="phone" id="phone" validate="telephone" required="no" class="span5" />
			</div>
		</div>
		<div class="control-group">
			<label for="email" class="control-label">Email</label>
			<div class="controls">
				<cfinput type="text" name="email" id="email" validate="email" required="no" class="span5" />
			</div>
		</div>
	</fieldset>
	<fieldset>
		<legend>Billing Information</legend>
		<div class="control-group">
			<label for="company_address1" class="control-label">Address 1</label>
			<div class="controls">
				<input type="text" name="company_address1" id="company_address1" class="span5" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_address2" class="control-label">Address 2</label>
			<div class="controls">
				<input type="text" name="company_address2" id="company_address2" class="span5" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_city" class="control-label">City</label>
			<div class="controls">
				<input type="text" name="company_city" id="company_city" class="span5" />
			</div>
		</div>
		<div class="control-group">
			<label for="company_state" class="control-label">State</label>
			<div class="controls">
				<cfselect name="company_state" id="company_state" query="get_states" display="state" value="state" size="1" class="span3"></cfselect>
			</div>
		</div>
		<div class="control-group">
			<label for="company_zip" class="control-label">Zip</label>
			<div class="controls">
				<cfinput type="text" name="company_zip" id="company_zip" required="no" validate="zipcode" size="5" message="Please enter a valid zip code" class="span3" />
			</div>
		</div>
	</fieldset>
	<div class="form-actions">
		<input type="submit" name="submit" value="Enter New Customer" class="btn btn-primary" />
		<input type="reset" value="Reset" class="btn" />
	</div>
</fieldset>
</cfform>