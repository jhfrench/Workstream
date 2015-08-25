
<!--Directory/dsp_phone_email_column.cfm
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
<cfif get_phone_types.recordcount>
	<fieldset>
		<legend><h4>Phone Number</h4></legend>
		<cfoutput query="get_phone_types">
		<div class="control-group">
			<label for="phone_#phone_type_id#" class="control-label">#phone_type#</label>
			<div class="controls">
				<div class="input-prepend input-append">
					<input type="tel" name="phone_#phone_type_id#" id="phone_#phone_type_id#" value="#evaluate('phone_#phone_type_id#')#" pattern="\d{3}[\-]\d{3}[\-]\d{4}" placeholder="999-999-9999" class="span4" />
					<span class="add-on"><abbr title="extension">ext</abbr></span>
					<input type="number" name="phone_#phone_type_id#_ext" required="no" value="#evaluate('phone_#phone_type_id#_ext')#" class="span1">
				</div>
			</div>
		</div>
		</cfoutput>
	</fieldset>
</cfif>
<cfif get_email_types.recordcount>
	<fieldset>
		<legend><h4>Email Address</h4></legend>
		<cfoutput query="get_email_types">
		<div class="control-group">
			<label for="email_#email_type_id#" class="control-label">#email_type#</label>
			<div class="controls">
				<input type="email" name="email_#email_type_id#" id="email_#email_type_id#" value="#evaluate('email_#email_type_id#')#" class="span3" />
			</div>
		</div>
		</cfoutput>
	</fieldset>
</cfif>
