
<!--Timekeeping/dsp_inactive_tasks.cfm
	Author: Jeromy F -->

	<!--- FUSEDOC
	||
	Responsibilities: I am the page that will dipslay all the tasks that are being completed by the inactivation of the parent client code.

	||
	Edits:
	$Log$
	 || 
	--> client_code: this the client code that is being inactivated
	<-- Outgoing Paramater

	END FUSEDOC --->
<cfparam name="delete_user_field_list" default="None">
<cfif attributes.active_ind EQ 1>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Tasks To Be Closed</h2></caption>
 	<thead>
		<tr>
			<th>Project Code</th>
			<th>Project Name</th>
			<th>Task ID</th>
			<th>Task Name</th>
			<th>Task Desctiption</th>
			<th>Task Owner</th>
		</tr>
 	</thead>
	<tbody>
	<cfoutput query="get_tasks_to_deactivate">
		<tr>
			<td>#project_code#</td>
			<td>#description#</td>
			<td>#task_id#</td>
			<td>#name#</td>
			<td>#task_description#</td>
			<td>#task_owner#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>

<cfoutput>
<form name="change" action="index.cfm?fuseaction=Customers.update_project" method="post" class="well">
	<fieldset>
		<legend>Are you sure that you want to deactivate all these tasks?</legend>
		<input type="submit" value="Continue" name="Submit" class="btn btn-danger" />
		<input type="button" value="Back" name="back" onclick="history.go(-1)" class="btn" />
		<input type="hidden" name="project_id" value="#attributes.project_id#">
		<input type="hidden" name="project_code" value="#attributes.project_code#" >
		<input type="hidden" name="description" value="#attributes.description#">
		<input type="hidden" name="billable_type_id" value="#attributes.billable_type_id#">
		<input type="hidden" name="active_ind" value="#attributes.active_ind#">
		<input type="hidden" name="company_id" value="#attributes.company_id#">
		<input type="hidden" name="budget" value="#attributes.budget#">
		<input type="hidden" name="start_date" value="#attributes.start_date#">
		<input type="hidden" name="end_date" value="#attributes.end_date#">
		<input type="hidden" name="months" value="#attributes.months#">
		<input type="hidden" name="task_id" value="#task_id#">
		<input type="hidden" name="company_id" value="#attributes.company_id#">
		<input type="hidden" name="field_title" value="#attributes.field_title#">
		<input type="hidden" name="new_code" value="#attributes.project_id#">
		<cfloop from="1" to="#listlen(attributes.Field_Title)#" index="ii">
		<cfset current_selection_title = "selection_title" & #ii#>
		<input type="hidden" name="#Current_Selection_Title#" value="#Evaluate(Current_Selection_Title)#">
		</cfloop>
		<input type="hidden" name="delete_user_field_list" value="#delete_user_field_list#">
	</fieldset>
</form>
</cfoutput> 
<cfelse>

<cfoutput>
<form name="auto" action="index.cfm?fuseaction=Customers.update_project" method="post">
	<input type="hidden" name="project_id" value="#attributes.project_id#">
	<input type="hidden" name="project_code" value="#attributes.project_code#" >
	<input type="hidden" name="description" value="#attributes.description#">
	<input type="hidden" name="billable_type_id" value="#attributes.billable_type_id#">
	<input type="hidden" name="active_ind" value="#attributes.active_ind#">
	<input type="hidden" name="company_id" value="#attributes.company_id#">
	<input type="hidden" name="budget" value="#attributes.budget#">
	<input type="hidden" name="start_date" value="#attributes.start_date#">
	<input type="hidden" name="end_date" value="#attributes.end_date#">
	<input type="hidden" name="months" value="#attributes.months#">
	<input type="hidden" name="company_id" value="#attributes.company_id#">
	<input type="hidden" name="field_title" value="#attributes.field_title#">
	<input type="hidden" name="new_code" value="#attributes.project_id#">
	<cfloop from="1" to="#listlen(Field_Title)#" index="ii">
	<cfset current_selection_title = "selection_title" & #ii#>
	<input type="hidden" name="#Current_Selection_Title#" value="#Evaluate(Current_Selection_Title)#">
	</cfloop>
	<input type="hidden" name="delete_user_field_list" value="#delete_user_field_list#">
</form> 
<script type="text/javascript">
document.auto.submit()
</script>
</cfoutput>
</cfif>