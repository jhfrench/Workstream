
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
<cfset today = now()>
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

<a href="index.cfm?fuseaction=Customers.new_engagement" class="btn"><i class="icon-plus-sign"></i> Add New Project</a>

<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Project Dashboard</h2></caption>
	<thead>
		<tr>
			<th>
				Customer &amp; Project Name
			</th>
			<th title="Date the project is to go live, or end (if known).">
				Due
			</th>
			<th>
				Status
			</th>
			<th>
				Progress
			</th>
			<th>
				Project Update
			</th>
			<th>
				Budgeted
			</th>
			<th>
				Invoiced
			</th>
			<th>
				Upselling Opportunities
			</th>
			<th>
				<abbr title="Project Manager">PM</abbr>
			</th>
			<th>
				Updated
			</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_engagement_dashboard">
		<tr> 
			<td id="#project_id#">
				<a href="javascript:edit_project(#project_id#);" title="Edit this project">#customer_description#&ndash;#description# (#project_code#)</a>
			</td>
			<td class="date">
				<cfif isdate(deadline_date)>
					#dateformat(deadline_date,'m/d/yyyy')#
				</cfif>
			</td>
			<td>
				<!--- Show status color image and set status color variable based on the status code--->
				<cfswitch expression="#status#">
					<cfcase value="1">
						<span style="background-image:url('images/bar_7.gif');"><i class="icon-star icon-white"></i></span> Good
					</cfcase>
					<cfcase value="2">
						<span style="background-image:url('images/bar_3.gif');"><i class="icon-flag icon-white"></i></span> Caution
					</cfcase>
					<cfdefaultcase>
						<!--- No status so display a red so I get attention --->
						<span style="background-image:url('images/bar_1.gif');"><i class="icon-fire icon-white"></i></span> Danger
					</cfdefaultcase>
				</cfswitch>
			</td>
			<td>
				<cfif eng_status EQ 0>Not Started</cfif>
				<cfif eng_status EQ 1>Approved&ndash;In Progress</cfif>
				<cfif eng_status EQ 11>Technical Review&ndash;Nucleus</cfif>
				<cfif eng_status EQ 12>Technical Review&ndash;Customer</cfif>
				<cfif eng_status EQ 2>Needs Customer Review</cfif>
				<cfif eng_status EQ 3>Reviewed&ndash;Needs Work</cfif>
				<cfif eng_status EQ 9>Sent for Content Approval</cfif>
				<cfif eng_status EQ 10>Approved&ndash;Not Scheduled</cfif>
				<cfif eng_status EQ 8>Getting LOE</cfif>
				<cfif eng_status EQ 7>Sent for Financial Approval</cfif>
				<cfif eng_status EQ 6>Withdrawn</cfif>
				<cfif eng_status EQ 5>On Hold</cfif>
				<cfif eng_status EQ 4>Completed</cfif>
			</td>
			<td>
				#vision#&nbsp;
			</td>
			<td class="number">
				&##36;#numberformat(budget,'___,___,___,___')#
				<cfif loe GT 0><br />h #LOE#</cfif>
			</td>
			<td class="number">
				&##36;<cfif len(total_bill_amount)>#numberformat(total_bill_amount,'___,___,___,___')#<cfelse>0</cfif>
			</td>
			<td>
				#mission#&nbsp;
			</td>
			<td>
				#lname#&nbsp;
			</td>
			<td class="date">
				#dateformat(date_updated, "m/d/yyyy")#
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_project" fuseaction="Customers.edit_engagement" field_name="project_id" processform="true" option="1" engagement_dashboard_return="1" customer_id="#attributes.customer_id#" project_manager_emp_id="#attributes.project_manager_emp_id#" sort="#attributes.sort#">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="account_status" fuseaction="Reports.account_status" field_name="project_id">