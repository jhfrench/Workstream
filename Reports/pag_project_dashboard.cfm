
<!--Reports/pag_project_dashboard.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view projects page

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="1">
</cfsilent>
<cfinclude template="qry_get_project_dashboard.cfm">
<cfinclude template="qry_get_project_ie.cfm">

<cfinclude template="dsp_project_dashboard_chart.cfm">
<a href="index.cfm?fuseaction=Customers.new_project" class="btn"><i class="icon-plus-sign"></i> Create New Project</a>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_project" fuseaction="Customers.edit_project" field_name="project_id" field2_name="option" field2_variable_ind="1" process_form_ind="true" project_dashboard_return_ind="1">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="account_status" fuseaction="Reports.account_status" field_name="project_id">

<form name="form_project_dashboard" action="index.cfm?fuseaction=<cfoutput>#attributes.fuseaction#</cfoutput>" method="post" class="well form-inline">
	<fieldset>
		<legend>Criteria</legend>
		<label for="active_ind_1" class="radio">
			<input type="radio" name="active_ind" id="active_ind_1" value="1" required="required"<cfif attributes.active_ind EQ 1> checked="checked"</cfif> />
			Active Projects
		</label>
		<label for="active_ind_0" class="radio">
			<input type="radio" name="active_ind" id="active_ind_0" value="0" required="required"<cfif attributes.active_ind EQ 0> checked="checked"</cfif> />
			Inactive Projects
		</label>
		<label for="customer_id">Customer</label>
		<select name="customer_id" class="span2">
			<option value="0" >All Customers</option>
			<cfoutput query="get_project_customers">
				<option value="#customer_id#"<cfif attributes.customer_id EQ customer_id> selected="selected"</cfif>>#description#</option>
			</cfoutput>
		</select>
		<label for="project_manager_id">Project managers</label>
		<select name="project_manager_id" class="span2">
			<option value="0">All project managers</option>
			<cfoutput query="get_project_ie">
				<option value ="#user_account_id#"<cfif attributes.project_manager_id EQ user_account_id> selected="selected"</cfif>>#last_name#</option>
			</cfoutput>
		</select>
		<!--- $issue$: #convert this to a jQuery client-side table sort --->
		<label for="sort">Sort option</label>
		<select name="sort" class="span2">
			<option value="Customer.description, Project.description">select sort variable</option>
			<option value="Customer.description, Project.description">Customer</option>
			<option value="Customer.description, Project.description DESC">Customer - descending</option>
			<option value="last_name"><abbr title="project manager">PM</abbr></option>
			<option value="last_name DESC"><abbr title="project manager">PM</abbr> - descending</option>
			<option value="project_end">Due Date</option>
			<option value="project_end DESC">Due Date - descending</option>
			<option value="project_status">Status</option>
			<option value="project_status DESC">Status - descending</option>
			<option value="Project.budget">Budgeted</option>
			<option value="Project.budget DESC">Budgeted - descending</option>
			<option value="Project.date_updated">Updated</option>
			<option value="Project.date_updated DESC">Updated - descending</option>
		</select>
		<input type="submit" value="Update Report" class="btn btn-primary" />
	</fieldset>
</form>