<!-- Administration/dsp_edit_ref_screen.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_screen.cfm">
	<responsibilities>
		I display the form for screen maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/15/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->
<cfform name="choose_screen" action="" method="post" class="well form-inline">
	<cfselect name="screen_id" value="screen_id" display="fuseaction" query="get_ref_screen" selected="#attributes.screen_id#"></cfselect>
	<input type="submit" alt="Retrieve Screen Settings" value="Retrieve Screen Settings" class="btn btn-primary" />
	<a href="index.cfm?fuseaction=Administration.edit_ref_screen" class="btn">Add new REF_Screen record</a>
</cfform>
<cfform name="ref_screen_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2><cfif attributes.screen_id EQ 0>Add new<cfelse>Edit existing</cfif> REF_Screen record</h2></legend>
		<div class="control-group">
			<label for="module_id">Module</label>
			<div class="controls">
				<cfselect name="module_id" id="module_id" query="get_ref_module" value="module_id" display="description" selected="#attributes.module_id#" required="yes" message="Please specify module.">
				</cfselect>
			</div>
		</div>
		<div class="control-group">
			<label for="new_fuseaction">Fuseaction</label>
			<div class="controls">
				<cfinput type="text" name="new_fuseaction" id="fuseaction" value="#listlast(attributes.new_fuseaction,'.')#" size="45" maxlength="45" required="yes" message="Please enter fuseaction">
				<p class="help-block">no need to type '[module].'</p>
			</div>
		</div>
		<div class="control-group">
			<label for="business_function_id">Business Function</label>
			<div class="controls">
				<cfselect name="business_function_id" id="business_function_id" query="get_business_function" value="business_function_id" display="description" selected="#attributes.business_function_id#" required="yes" message="Please specify business function.">
				</cfselect>
			</div>
		</div>
	<cfif attributes.screen_id EQ 0>
		<input type="hidden" name="active_ind" value="1" />
	<cfelse>
		<cfif attributes.active_ind>
			<cfset variables.yes_check="yes">
			<cfset variables.no_check="no">
		<cfelse>
			<cfset variables.yes_check="no">
			<cfset variables.no_check="yes">
		</cfif>
		<div class="control-group">
			<label class="control-label">Active</label>
			<div class="controls">
				<label for="active_ind_yes" class="radio"><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes">Yes </label>
				<label for="active_ind_no" class="radio"><cfinput type="radio" name="active_ind" id="active_ind_no" value="0" >No </label>
			</div>
			<p class="help-block">An inactive record is treated as if it were deleted.</p>
		</div>
	</cfif>
		<div class="control-group">
			<label for="check_variable">Check variable</label>
			<div class="controls">
				<cfinput type="text" name="check_variable" id="check_variable" size="30" maxlength="100" value="#attributes.check_variable#">
				<p class="help-block">If supplied, system will check for the existence of this variable. Be sure to include variable scope.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="relocate">Relocate</label>
			<div class="controls">
				<cfselect name="relocate" id="relocate" query="get_ref_screen" value="fuseaction" display="fuseaction" selected="#attributes.relocate#">
				</cfselect>
				<p class="help-block">Where should the user be sent if the required attribute is not defined?</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Starting Point Indicatior</label>
			<div class="controls">
				<cfif attributes.starting_point_ind>
					<cfset variables.yes_check="yes">
					<cfset variables.no_check="no">
				<cfelse>
					<cfset variables.yes_check="no">
					<cfset variables.no_check="yes">
				</cfif>
				<label for="starting_point_ind_yes" class="radio"><cfinput type="radio" name="starting_point_ind" id="starting_point_ind_yes" value="1" checked="#variables.yes_check#">Yes </label>
			 	<label for="starting_point_ind_no" class="radio"><cfinput type="radio" name="starting_point_ind" id="starting_point_ind_no" value="0" checked="#variables.no_check#">No </label>
			</div>
		</div>
		<div class="control-group">
			<label for="body_onload">Body Onload</label>
			<div class="controls">
				<cfinput type="text" name="body_onload" id="body_onload" size="40" maxlength="4000" value="#attributes.body_onload#" required="no">
				<p class="help-block">Additional JavaScript to execute when this screen is loaded.</p>
			</div>
		</div>
		<div class="form-actions">
			<cfoutput>
			<input type="hidden" name="screen_id" value="#attributes.screen_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
			</cfoutput>
		</div>
	</fieldset>
</cfform>