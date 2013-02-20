<!-- Administration/dsp_edit_ref_business_function.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_business_function.cfm">
	<responsibilities>
		I desplay the form for business function maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/14/2007" role="FuseCoder" comments="Created File">
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

<cfoutput>
<cfif len(variables.display_message)>
	<div class="alert">#variables.display_message#</div>
</cfif>
<cfmodule template="qry_get_business_function.cfm" business_function_id="0">

<form name="ref_business_function_form" action="index.cfm?fuseaction=#fuseaction#" method="post" class="well form-inline">
	<label for="business_function_id">Retrieve an existing business function</label>
	<select name="business_function_id">
	<cfloop query="get_business_function"><option value="#business_function_id#"<cfif NOT comparenocase(get_business_function.business_function_id, attributes.business_function_id)> selected="selected"</cfif>>#description#</option></cfloop>
	</select>
	<input type="submit" name="method" value="Retrieve and edit business function" class="btn btn-primary" />
	<a href="index.cfm?fuseaction=Administration.edit_ref_business_function" class="btn">Create new REF_Screen record</a>
</form>
<br/>
<cfform name="REF_business_function_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2><cfif attributes.business_function_id EQ 0>Create new<cfelse>Edit existing</cfif> REF_Business_Function record</h2></legend>
		<div class="control-group">
			<label for="description" class="control-label">Description</label>
			<div class="controls">
					<cfinput type="text" name="description" id="description" value="#attributes.description#" size="30" maxlength="200" required="yes" message="Please enter description.">
				<p class="help-block">This is what will get displayed in the navigation bar.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="acronym" class="control-label">Acronym</label>
			<div class="controls">
				<cfinput type="text" name="acronym" id="acronym" value="#attributes.acronym#" size="15" maxlength="15" required="yes" message="Please enter acronym.">
			</div>
		</div>
		<div class="control-group">
			<label for="parent_business_function_id" class="control-label">Parent business function</label>
			<div class="controls">
				<select name="parent_business_function_id">
					<option value="NULL">No Parent</option>
					<cfloop query="get_business_function"><option value="#business_function_id#"<cfif NOT comparenocase(get_business_function.business_function_id, attributes.parent_business_function_id)> selected="selected"</cfif>>#description#</option></cfloop>
				</select>
				<p class="help-block">Not required, but used to nest navigation. This is the business function under which this record will be grouped in the navigation bar.</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Is a login required to access?</label>
			<div class="controls">
				<label for="require_login_ind_yes" class="radio"><cfinput type="radio" name="require_login_ind" id="require_login_ind_yes" value="1" checked="#variables.require_login_ind_yes#">Yes</label>
				<label for="require_login_ind_no" class="radio"><cfinput type="radio" name="require_login_ind" id="require_login_ind_no" value="0" checked="#variables.require_login_ind_no#">No</label>
				<p class="help-block">If a login is not required to access, this business function will show in everyone's naviation bar.</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Default Access Indicator</label>
			<div class="controls">
				<label for="default_access_ind_yes" class="radio"><cfinput type="radio" name="default_access_ind" id="default_access_ind_yes" value="1" checked="#variables.default_access_ind_yes#">Yes</label>
				<label for="default_access_ind_no" class="radio"><cfinput type="radio" name="default_access_ind" id="default_access_ind_no" value="0" checked="#variables.default_access_ind_no#">No</label>
				<p class="help-block">Should all users have access to this business function as a default setting?</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Viewable Indicator?</label>
			<div class="controls">
				<label for="viewable_ind_yes" class="radio"><cfinput type="radio" name="viewable_ind" id="viewable_ind_yes" value="1" checked="#variables.viewable_ind_yes#">Yes</label>
				<label for="viewable_ind_no" class="radio"><cfinput type="radio" name="viewable_ind" id="viewable_ind_no" value="0" checked="#variables.viewable_ind_no#">No</label>
				<p class="help-block">Does this business function need to show up in the navigation bar?</p>
			</div>
		</div>
		<div class="control-group">
			<label for="sort_order" class="control-label">Sort Order</label>
			<div class="controls">
				<input type="number" name="sort_order" id="sort_order" value="#attributes.sort_order#" step="1" min="0" class="span5" />
			</div>
		</div>
	<cfif attributes.business_function_id EQ 0>
		<input type="hidden" name="active_ind" value="1" />
	<cfelse>
		<div class="control-group">
			<label class="control-label">Active</label>
			<div class="controls">
				<label for="active_ind_yes" class="radio"><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="#variables.active_ind_yes#">Yes</label>
				<label for="active_ind_no" class="radio"><cfinput type="radio" name="active_ind" id="active_ind_no" value="0" checked="#variables.active_ind_no#">No</label>
				<p class="help-block">An inactive record is treated as if it were deleted.</p>
			</div>
		</div>
	</cfif>
		<div class="form-actions">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="business_function_id" value="#attributes.business_function_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>