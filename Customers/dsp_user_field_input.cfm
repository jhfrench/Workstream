
<!--Customers/dsp_user_field_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I ask the user how many user fields of each available type that they want for an project.
	||
	Name: Jeromy French
	 || 
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfinclude template="qry_get_user_field_types.cfm">
<cfoutput query="get_user_field_types">
	<div class="control-group">
		<label class="control-label" for="field#user_field_type_id#">Number of #lcase(user_field_type)# form fields</label>
		<div class="controls">
			<input type="number" name="field#user_field_type_id#" id="field#user_field_type_id#" step="1" min="0" max="10" required="required" class="span5" />
			<p class="help-block">You can always add or retire custom fields when editing an project.</p>
		</div>
	</div>
</cfoutput>