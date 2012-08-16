
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
			<label for="phone_#phone_type_id#">#phone_type#</label>
			<div class="controls">
				<cfinput name="phone_#phone_type_id#" id="phone_#phone_type_id#" value="#evaluate('phone_#phone_type_id#')#" message="Please enter a properly formatted #phone_type# phone number." validate="telephone" class="span4">&nbsp;ext.<cfinput name="phone_#phone_type_id#_ext" required="no" value="#evaluate('phone_#phone_type_id#_ext')#" message="Please enter the #phone_type# extension as a number." validate="integer" class="span1">
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
			<label for="email_#email_type_id#">#email_type#</label>
			<div class="controls">
				<input type="email" name="email_#email_type_id#" id="email_#email_type_id#" value="#evaluate('email_#email_type_id#')#" class="span3">
			</div>
		</div>
		</cfoutput>
	</fieldset>
</cfif>
