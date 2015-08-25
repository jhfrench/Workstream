
<!--Directory/dsp_locations_column.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the employee details entry and edit form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<fieldset>
	<legend><h3>Addresses</h3></legend>
<cfoutput query="get_locations">
	<fieldset>
		<legend><h4>#location_type#</h4></legend>
		<div class="control-group">
			<label for="address1_#location_type_id#" class="control-label">Address 1</label>
			<div class="controls">
				<input type="text" name="address1_#location_type_id#" id="address1_#location_type_id#" value="#evaluate('address1_#location_type_id#')#" maxlength="50" class="span3" />
			</div>
		</div>
		<div class="control-group">
			<label for="address2_#location_type_id#" class="control-label">Address 2</label>
			<div class="controls">
				<input type="text" name="address2_#location_type_id#" id="address2_#location_type_id#" value="#evaluate("address2_#location_type_id#")#"  maxlength="50" class="span3" />
			</div>
		</div>
		<div class="control-group">
			<label for="city_#location_type_id#" class="control-label">City</label>
			<div class="controls">
				<input type="text" name="city_#location_type_id#" id="city_#location_type_id#" value="#evaluate('city_#location_type_id#')#" maxlength="50" class="span3" />
			</div>
		</div>
		<div class="control-group">
			<label for="state_#location_type_id#" class="control-label">State</label>
			<div class="controls">
				<cfselect name="state_#location_type_id#" id="state_#location_type_id#" query="get_states" selected="#evaluate('state_#location_type_id#')#" value="state_abbr" display="state_abbr" class="span3" />
			</div>
		</div>
		<div class="control-group">
			<label for="zip_#location_type_id#" class="control-label">Zip</label>
			<div class="controls">
				<input type="text" name="zip_#location_type_id#" id="zip_#location_type_id#" value="#evaluate('zip_#location_type_id#')#" pattern="(\d{5}([\-]\d{4})?)" placeholder="99999 or 99999-9999" maxlength="10" class="span3" />
			</div>
		</div>
	</fieldset>
</cfoutput>
</fieldset>