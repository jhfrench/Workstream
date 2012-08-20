 
<!--Customers/dsp_edit_engagement_main.cfm
	Author: Jeromy French -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the list of details that a user can edit on an engagement.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="engagement_dashboard_return" default="0">
</cfsilent>
<cfinclude template="qry_get_engagement_main.cfm">
<cfinclude template="qry_get_root_codes.cfm">
<cfinclude template="qry_get_companies.cfm">
<cfinclude template="../common_files/qry_get_products.cfm">
<cfoutput>
<cfform name="edit_engagement_main_form" action="index.cfm?fuseaction=Customers.edit_engagement" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>Edit Project for <a href="javascript:engagement_list('#get_customer_name_code.root_code#');" title="View other projects for this customer.">#get_customer_name_code.project_name#</a>&ndash; #get_customer_name_code.project_code#</h2></legend>
		<div class="control-group">
			<label for="customer_id">Root Code</label>
			<div class="controls">
				<cfselect name="customer_id" id="customer_id" size="1" query="get_root_codes" value="customer_id" selected="#get_engagement_main.customer_id#" required="yes" display="display"></cfselect>
			</div>
		</div>
		<div class="control-group">
			<label for="description">Project Name</label>
			<div class="controls">
				<cfinput type="text" name="description" id="description" value="#get_engagement_main.description#" required="yes" message="Please enter an Project Name" size="45" />
				<p class="help-block">Choose a unique project name.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="company_id">Visible To</label>
			<div class="controls">
				<select name="company_id" id="company_id" multiple="multiple" size="4">
					<cfloop query="get_companies">
						<option value="#company_id#"<cfif listcontains(session.workstream_selected_company_id,company_id)> selected="selected"</cfif>>#description#</option>
					</cfloop>
				</select>
				<p class="help-block">Specify which companies' employees should see this engagement.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="project_manager_emp_id"><abbr title="Project Manager">PM</abbr>/Account Management</label>
			<div class="controls">
				<cfmodule template="../common_files/dsp_team_select.cfm" size="6" select_name="project_manager_emp_id" emp_id="#get_engagement_main.project_manager_emp_id#">
			</div>
		</div>
		<div class="control-group">
			<label for="file_path">File Path</label>
			<div class="controls">
				<div class="input-append">
					<input type="text" name="file_path" id="file_path" value="#get_engagement_main.file_path#" class="span3">
					<a href="javascript:window.open('index.cfm?fuseaction=common_files.file_attach', 'files', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=210');" title="Associate a file path to this task." class="btn"><i class="icon-folder-open"></i> Specify</a>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label for="product_id">Product</label>
			<div class="controls">
				<cfselect name="product_id" id="product_id" query="get_products" value="product_id" display="product_name" selected="#get_engagement_main.product_id#" required="yes" message="Please choose which product this engagement applies to." size="4"></cfselect>
				<p class="help-block">Specify which product this engagement will cover.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="active_ind">Status</label>
			<div class="controls">
				<select name="active_ind" id="active_ind">
					<option value="1" <cfif get_engagement_main.active_ind EQ 1> selected="selected"</cfif>>Active</option>
					<option value="0" <cfif get_engagement_main.active_ind EQ 0> selected="selected"</cfif>>Inactive</option>
				</select>
			</div>
		</div>
		<fieldset>
		<legend>Project Dates</legend>
		<div class="control-group">
			<label for="project_start">Start</label>
			<div class="controls">
				<input type="date" name="project_start" id="project_start" value="#dateformat(get_engagement_main.project_start,'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
				<p class="help-block">Required; please enter a proper date for which work is to begin on this engagement.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="project_end">End</label>
			<div class="controls">
				<input type="date" name="project_end" id="project_end" value="#dateformat(get_engagement_main.project_end,'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
				<p class="help-block">Optional; date for which work is expected to end on this engagement.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="date_go_live">Go Live</label>
			<div class="controls">
				<input type="date" name="date_go_live" id="date_go_live" value="#dateformat(get_engagement_main.date_go_live,'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" class="span3 date" />
				<p class="help-block">Optional; date project is expected to be delivered.</p>
			</div>
		</div>
		</fieldset>
		<div class="control-group">
			<label for="status">Status</label>
			<div class="controls">
				<select name="status" id="status">
					<option value="0"<cfif get_engagement_main.status EQ 0> selected="selected"</cfif>>None</option>
					<option value="1"<cfif get_engagement_main.status EQ 1> selected="selected"</cfif>>Good</option>
					<option value="2"<cfif get_engagement_main.status EQ 2> selected="selected"</cfif>>Warning</option>
					<option value="3"<cfif get_engagement_main.status EQ 3> selected="selected"</cfif>>Danger</option>
				</select>
				<p class="help-block">What is your impression of the health of the project?</p>
			</div>
		</div>
		<div class="control-group">
			<label for="eng_status">Progress</label>
			<div class="controls">
				<select name="eng_status" id="eng_status">
					<option value="0"<cfif get_engagement_main.eng_status EQ 0> selected="selected"</cfif>>Not Started</option>
					<option value="1"<cfif get_engagement_main.eng_status EQ 1> selected="selected"</cfif>>Approved - In Progress</option>
					<option value="11"<cfif get_engagement_main.eng_status EQ 11> selected="selected"</cfif>>Technical Review - Nucleus</option>
					<option value="12"<cfif get_engagement_main.eng_status EQ 12> selected="selected"</cfif>>Technical Review - Customer</option>
					<option value="2"<cfif get_engagement_main.eng_status EQ 2> selected="selected"</cfif>>Needs Customers Review</option>
					<option value="3"<cfif get_engagement_main.eng_status EQ 3> selected="selected"</cfif>>Reviewed - Needs Work</option>
					<option value="9"<cfif get_engagement_main.eng_status EQ 9> selected="selected"</cfif>>Sent for Content Approval</option>
					<option value="10"<cfif get_engagement_main.eng_status EQ 10> selected="selected"</cfif>>Approved - Not Scheduled</option>
					<option value="8"<cfif get_engagement_main.eng_status EQ 8> selected="selected"</cfif>>Getting LOE</option>
					<option value="7"<cfif get_engagement_main.eng_status EQ 7> selected="selected"</cfif>>Sent for Financial Approval</option>
					<option value="6"<cfif get_engagement_main.eng_status EQ 6> selected="selected"</cfif>>Withdrawn</option>
					<option value="5"<cfif get_engagement_main.eng_status EQ 5> selected="selected"</cfif>>On Hold</option>
					<option value="4"<cfif get_engagement_main.eng_status EQ 4> selected="selected"</cfif>>Completed</option>
				</select>
				<p class="help-block">What is the project's current work status?</p>
			</div>
		</div>
		<div class="control-group">
			<label for="vision">Project Update</label>
			<div class="controls">
				<textarea name="vision" id="vision" cols="60" rows="3">#get_engagement_main.vision#</textarea>
				<p class="help-block">Optional</p>
			</div>
		</div>
		<div class="control-group">
			<label for="mission">Upselling Opportunities</label>
			<div class="controls">
				<textarea name="mission" id="mission" cols="60" rows="3">#get_engagement_main.mission#</textarea>
				<p class="help-block">Optional</p>
			</div>
		</div>
		<div class="control-group">
			<label for="business_case">Other Notes</label>
			<div class="controls">
				<textarea name="business_case" id="business_case" cols="60" rows="3">#get_engagement_main.business_case#</textarea>
				<p class="help-block">Optional</p>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="project_id" value="#attributes.project_id#" />
			<input type="hidden" name="option" value="1" />
			<input type="hidden" name="edit" value="1" />
			<input type="hidden" name="engagement_dashboard_return" value="#engagement_dashboard_Return#" />
			<input type="submit" value="Proceed" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>
