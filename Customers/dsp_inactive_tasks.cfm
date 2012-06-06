
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
<cfif attributes.active_ind eq 1>
<div align="center" class="HeadText">Tasks to be closed</div>
<table cellpadding="4" cellspacing="0" border="0" align="center" width="95%">
<tr bgcolor="#0000ff">
	<td class="SubHeadTextWhite">Project Code</td>
	<td class="SubHeadTextWhite">Project Name</td>
	<td class="SubHeadTextWhite">Task Name</td>
	<td class="SubHeadTextWhite">Task Desctiption</td>
	<td class="SubHeadTextWhite">Task Owner</td>
	<td class="SubHeadTextWhite">Task ID</td>
</tr>
<cfoutput query="tasks_to_inactive">
<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
	<td class="RegText">#project_code#</td>
	<td class="RegText">#description#</td>
	<td class="RegText">#name#</td>
	<td class="RegText">#task_Description#</td>
	<td class="RegText">#task_owner#</td>
	<td class="RegText">#task_id#</td>
</tr>
</cfoutput>
	<tr>
		<td colspan="6" align="center"  class="RegText">
		Are you sure that you want to deactivate all these tasks? <form action="index.cfm?fuseaction=Customers.update_engagement" method="post" name="change"> <input type="submit" value="Continue" name="Submit"> <input type="button" value="Back" name="back" onclick="history.go(-1)">
		</td>
	</tr>
</table>


<cfoutput>
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
<cfloop from="1" to="#ListLen(attributes.Field_Title)#" index="ii">
<cfset current_selection_title = "selection_title" & #ii#>
<input type="hidden" name="#Current_Selection_Title#" value="#Evaluate(Current_Selection_Title)#">
</cfloop>
<input type="hidden" name="delete_user_field_list" value="#delete_user_field_list#">
</cfoutput>
</form> 
<cfelse>

<form action="index.cfm?fuseaction=Customers.update_engagement" method="post" name="auto">
<cfoutput>
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
<cfloop from="1" to="#ListLen(Field_Title)#" index="ii">
<cfset current_selection_title = "selection_title" & #ii#>
<input type="hidden" name="#Current_Selection_Title#" value="#Evaluate(Current_Selection_Title)#">
</cfloop>
<input type="hidden" name="delete_user_field_list" value="#delete_user_field_list#">
</cfoutput>
<script type="text/javascript">
document.auto.submit()
</script>
</form> 

</cfif>
</body>
