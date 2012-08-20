
<!--Reports/pag_engagement_dashboard.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="1">
</cfsilent>
<cfinclude template="qry_get_engagement_dashboard.cfm">
<cfinclude template="qry_get_engagement_ie.cfm">

<form name="form_engagement_dashboard" action="index.cfm?fuseaction=<cfoutput>#attributes.fuseaction#</cfoutput>" method="post" class="well form-inline">
			<label for="active_ind">Project view</label>
			<select name="active_ind" class="span2">
				<option value="1"<cfif attributes.active_ind EQ 1> selected="selected"</cfif>>Active only</option>
				<option value="0"<cfif attributes.active_ind EQ 0> selected="selected"</cfif>>Inactive only</option>
			</select>
			<label for="customer_id">Customer</label>
			<select name="customer_id" class="span2">
				<option value="0" >All Customers</option>
				<cfoutput query="get_engagement_customers">
					<option value="#customer_id#"<cfif attributes.customer_id EQ customer_id> selected="selected"</cfif>>#description#</option>
				</cfoutput>
			</select>
			<label for="project_manager_emp_id">Project managers</label>
			<select name="project_manager_emp_id" class="span2">
				<option value="0">All project managers</option>
				<cfoutput query="get_engagement_ie">
					<option value ="#emp_id#"<cfif attributes.project_manager_emp_id EQ emp_id> selected="selected"</cfif>>#lname#</option>
				</cfoutput>
			</select>
			<label for="sort">Sort option</label>
			<select name="sort" class="span2">
				<option value="Customer.description, Project.description">select sort variable</option>
				<option value="Customer.description, Project.description">Customer</option>
				<option value="Customer.description, Project.description DESC " ">Customer - descending</option>
				<option value="lname"><abbr title="project manager">PM</abbr></option>
				<option value="lname DESC " "><abbr title="project manager">PM</abbr> - descending</option>
				<option value="project_end">Due Date</option>
				<option value="project_end DESC " ">Due Date - descending</option>
				<option value="status">Status</option>
				<option value="status DESC " ">Status - descending</option>
				<option value="Project.budget">Budgeted</option>
				<option value="Project.budget DESC " ">Budgeted - descending</option>
				<option value="Project.date_updated">Updated</option>
				<option value="Project.date_updated DESC " ">Updated - descending</option>
			</select>
			<input type="submit" value="Go" class="btn btn-primary" />
</form>

<a href="index.cfm?fuseaction=Customers.new_engagement" class="btn"><i class="icon-plus-sign"></i> Add New Project</a>
<cfinclude template="dsp_engagement_dashboard_chart.cfm">

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_project" fuseaction="Customers.edit_engagement" field_name="project_id" processform="true" option="1" engagement_dashboard_return="1" customer_id="#attributes.customer_id#" project_manager_emp_id="#attributes.project_manager_emp_id#" sort="#attributes.sort#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="account_status" fuseaction="Reports.account_status" field_name="project_id">