
<!--Reports/pag_engagement_dashboard.cfm
	Author: Jeromy F  -->
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
<cfset today = now()>
</cfsilent>
<cfinclude template="qry_get_engagement_dashboard.cfm">
<cfinclude template="qry_get_engagement_ie.cfm">

<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Project Dashboard</h2></caption>
	<cfinclude template="dsp_engagement_dashboard_row_header.cfm">
	<cfinclude template="dsp_engagement_dashboard_rows.cfm">
</table>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_project" fuseaction="Customers.edit_engagement" field_name="project_id" processform="true" option="1" engagement_dashboard_return="1" customer_id="#attributes.customer_id#" project_manager_emp_id="#attributes.project_manager_emp_id#" sort="#attributes.sort#">

 <a href="index.cfm?fuseaction=Customers.new_engagement" class="btn"><i class="icon-plus-sign"></i> Add New Project</a>
 
<!--- This form is used for restricting and sorting the records displayed above.
	  Restriction can be placed on Customer and IE.  Sorting can be done on any column
 --->
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
					<option value ="#emp_id#"<cfif attributes.project_manager_emp_id EQ Emp_ID> selected="selected"</cfif>>#lname#</option>
				</cfoutput>
			</select>
			<label for="sort">Sort option</label>
			<select name="sort" class="span2">
				<option value="Customer.description,Project.description">Select Sort Variable</option>
				<option value="Customer.description,Project.description">Customer</option>
				<option value="Customer.description,Project.description DESC">Customer - Desc</option>
				<option value="LName">IE</option>
				<option value="LName DESC">IE - Desc</option>
				<option value="Project_end">Due Date</option>
				<option value="Project_end DESC">Due Date - Desc</option>
				<option value="Status">Status</option>
				<option value="Status DESC">Status - Desc</option>
				<option value="Project.budget">Revenue</option>
				<option value="Project.budget DESC">Revenue - Desc</option>
				<option value="Project.date_updated">Date Updated</option>
				<option value="Project.Date_Updated DESC">Date Updated - Desc</option>
			</select>
			<input type="submit" value="Go" class="btn btn-primary" />
</form>