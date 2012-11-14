
<!--Customers/dsp_edit_project_custom.cfm
	Author: Jeromy French -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the custom fields for an project.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.start=1>
</cfsilent>
<cfparam name="attributes.customer_id" default="0">
<cfparam name="project_dashboard_return" default="0">
<cfparam name="attributes.project_manager_id" default="0">
<cfparam name="sort" default="Customer.description,Project.description">
<cfset attributes.req_custom=1>
<cfset attributes.field1=1>
<cfset attributes.field2=1>

<cfinclude template="../common_files/qry_get_user_fields.cfm">
<cfoutput>
<cfform name="edit_project_main" action="index.cfm?fuseaction=Customers.edit_project" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>Edit Project for <a href="javascript:project_list('#get_customer_name_code.root_code#');" title="View other projects for this customer.">#get_customer_name_code.project_name#</a>&ndash; #get_customer_name_code.project_code#</h2></legend>
<cfloop query="get_user_fields">
	<cfif field_type_id EQ 1>
		<cfinclude template="../common_files/qry_get_drop_down_options.cfm">
		<div class="control-group">
			<label for="#field_title#" class="control-label">#field_title#</label>
			<div class="controls">
				<select name="#field_title#" id="#field_title#" class="span3">
					<cfloop query="get_drop_down_options">
					<option value="#get_drop_down_options.user_field_items_id#">#get_drop_down_options.selection_title#</option>
					</cfloop>
				</select>
				<label for="retire#user_field_id#">Retire<input type="checkbox"<cfif active_ind EQ 1> checked="checked"</cfif> name="retire" id="retire#user_field_id#" value="#user_field_id#"></label>
				<p class="help-block">Click 'retire' checkbox to remove this custom field from displaying on a task for this project (archived data will remain in the database). Use the given label fields to make any text changes to form field names and options, but remember that archived data will reflect your changes.</p>
			</div>
		</div>
	<cfelseif field_type_id EQ 2>
		<div class="control-group">
			<label for="#field_title#" class="control-label">#field_title#</label>
			<div class="controls">
				<input type="text" name="display_#get_user_fields.currentrow#" id="display_#get_user_fields.currentrow#" size="8" value="" />
				<p class="help-block">Click 'retire' checkbox to remove this custom field from displaying on a task for this project (archived data will remain in the database). Use the given label fields to make any text changes to form field names and options, but remember that archived data will reflect your changes.</p>
			</div>
		</div>
	</cfif>
</cfloop>
<cfinclude template="dsp_user_field_labels.cfm">
		<div class="form-actions">
			<input type="hidden" name="project_id" value="#attributes.project_id#" />
			<input type="hidden" name="option" value="3" />
			<input type="hidden" name="edit" value="1" />
			<input type="hidden" name="project_dashboard_Return" value="#project_dashboard_Return#" />
			<input type="hidden" name="customer_id" value="#attributes.customer_id#" />
			<input type="hidden" name="project_manager_id" value="#attributes.project_manager_id#" />
			<input type="hidden" name="Sort" value="#sort#" />
			<input type="submit" value="Proceed" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>