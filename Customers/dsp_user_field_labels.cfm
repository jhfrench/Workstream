
<!--Customers/dsp_user_field_labels.cfm
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
<cfparam name="variables.start" default="1">
</cfsilent>
<cfinclude template="qry_get_user_field_types.cfm">
<cfif attributes.req_custom AND (isdefined("attributes.field1") AND attributes.field1 NEQ 0 OR isdefined("attributes.field2") AND attributes.field2 NEQ 0)>
	<cfoutput query="get_user_field_types">
	<fieldset>
		<legend><h4>#user_field_type# custom fields</h4></legend>
		<cfloop from="1" to="#evaluate('attributes.field#user_field_type_id#')#" index="ii">
		<div class="control-group">
			<label class="control-label" for="type_#user_field_type_id#_num_#ii#_name">Label</label>
			<div class="controls">
				<cfinput type="text" name="type_#user_field_type_id#_num_#ii#_name" id="type_#user_field_type_id#_num_#ii#_name" class="span3" />
				<p class="help-block">Provide the labels for each of your desired custom fields.</p>
			</div>
		</div>
	<cfif user_field_type_id NEQ 2>
		<cfloop from="1" to="8" index="opt_ii">
		<div class="control-group">
			<label class="control-label" for="type_#user_field_type_id#_num_#ii#_opt_#opt_ii#">Option value #opt_ii#</label>
			<div class="controls">
				<cfinput type="text" name="type_#user_field_type_id#_num_#ii#_opt_#opt_ii#" id="type_#user_field_type_id#_num_#ii#_opt_#opt_ii#" value="" class="span3" />
				<p class="help-block">For drop-down boxes, also provide the possible options, leaving blank any extra 'option value' fields. Any labels left blank will be ignored and will not be applied as custom fields to the project.</p>
			</div>
		</div>
		</cfloop>
	</cfif>
		</cfloop>
	</cfoutput>
	</fieldset>
<cfelse>
	<script type="text/javascript">
		$(document).ready(function() {
			document.new_project.submit();
		});
	</script>
	<div class="alert alert-warning">
		<p>No information to enter for this step.</p>
		<p>If this page does not automatically do so, please submit to the next page.</p>
	</div>
</cfif>