
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
<cfparam name="attributes.project_status_id" default="0">
</cfsilent>
<cfinclude template="qry_get_project_dashboard.cfm">
<cfinclude template="../common_files/qry_get_project_manager.cfm">
<cfinclude template="../common_files/act_table_sorting.cfm">

<cfinclude template="dsp_project_dashboard_chart.cfm">
<a href="index.cfm?fuseaction=Customers.new_project" class="btn"><i class="icon-plus-sign"></i> Create New Project</a>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_project" fuseaction="Customers.edit_project" field_name="project_id" field2_name="option" field2_variable_ind="1" process_form_ind="true">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="account_status" fuseaction="Reports.account_status" field_name="project_id">
<cfoutput>
<form name="form_project_dashboard" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	<fieldset>
		<legend>Criteria</legend>
		<label for="project_status_id1" class="checkbox inline">
			<input type="checkbox" name="project_status_id" id="project_status_id_1" value="1,2,3,4,5,6,7,8,10,11" required="required"<cfif listfindnocase(attributes.project_status_id, 1)> checked="checked"</cfif> />
			Active Projects
		</label>
		<label for="project_status_id2" class="checkbox inline">
			<input type="checkbox" name="project_status_id" id="project_status_id_2" value="9,12,13" required="required"<cfif listfindnocase(attributes.project_status_id, 9)> checked="checked"</cfif> />
			Inactive Projects
		</label>
		<label for="customer_id">Customer</label>
		<select name="customer_id" class="span2">
			<option value="0">All Customers</option>
			<cfloop query="get_project_customer">
				<option value="#customer_id#"<cfif attributes.customer_id EQ customer_id> selected="selected"</cfif>>#description#</option>
			</cfloop>
		</select>
		<label for="project_manager_id">Project Managers</label>
		<select name="project_manager_id" class="span2">
			<option value="0">All project managers</option>
			<cfloop query="get_project_manager">
				<option value ="#user_account_id#" title="#last_name#, #first_name#"<cfif attributes.project_manager_id EQ user_account_id> selected="selected"</cfif>>#last_name#, #left(first_name, 2)#</option>
			</cfloop>
		</select>
		<input type="submit" value="Update Report" class="btn btn-primary" />
	</fieldset>
</form>
</cfoutput>