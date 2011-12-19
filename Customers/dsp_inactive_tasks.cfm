
<cfparam name="delete_user_field_list" default="None">
<!--timekeeping_dev/DSP_Inactive_Tasks.cfm
	Author: Jeromy F -->

	<!--- FUSEDOC
	||
	Responsibilities: I am the page that will dipslay all the tasks that are being completed 
	by the inactivation of the parent client code.

	||
	Edits:
	$Log$
	||
	--> client_code: this the client code that is being inactivated
	<-- Outgoing Paramater
	
	END FUSEDOC --->
 <cfif attributes.active_id eq 1>
 <div align="center" class="headtext<cfoutput>#session.workstream_text_size#</cfoutput>">Tasks to be closed</div>
   
    <table cellpadding="4" cellspacing="0" border="0" align="center" width="95%">
<tr bgcolor="#0000ff">
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Engagement Code</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Engagement Name</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Task Name</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Task Desctiption</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Task Owner</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Task ID</td>
</tr>
<cfoutput query="tasks_to_inactive">
<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
	<td class="RegText#session.workstream_text_size#">#project_code#</td>
	<td class="RegText#session.workstream_text_size#">#description#</td>
	<td class="RegText#session.workstream_text_size#">#name#</td>
	<td class="RegText#session.workstream_text_size#">#task_Description#</td>
	<td class="RegText#session.workstream_text_size#">#task_owner#</td>
	<td class="RegText#session.workstream_text_size#">#task_id#</td>
</tr>
</cfoutput>
	<tr>
		<td colspan="6" align="center"  class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Are you sure that you want to inactivate all these tasks? <form action="index.cfm?fuseaction=Customers.update_engagement" method="post" name="change"> <input type="Submit" value="Continue" name="Submit" tabindex="3"> <input type="Button" value="Back" name="back" onclick="history.go(-1)">
		</td>
	</tr>
</table>


<cfoutput>
<input type="Hidden" name="project_id" value="#attributes.project_id#">
<input type="Hidden" name="project_code" value="#attributes.project_code#" >
<input type="Hidden" name="description" value="#attributes.description#">
<input type="Hidden" name="billable_type_id" value="#attributes.billable_type_id#">
<input type="Hidden" name="active_id" value="#attributes.active_id#">
<input type="Hidden" name="company_id" value="#attributes.company_id#">
<input type="Hidden" name="budget" value="#attributes.budget#">
<input type="Hidden" name="start_date" value="#attributes.start_date#">
<input type="Hidden" name="end_date" value="#attributes.end_date#">
<input type="Hidden" name="months" value="#attributes.months#">
<input type="Hidden" name="task_id" value="#task_id#">
<input type="Hidden" name="company_id" value="#attributes.company_id#">
<input type="Hidden" name="field_title" value="#attributes.field_title#">
<input type="Hidden" name="new_code" value="#attributes.project_id#">
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
<input type="Hidden" name="project_id" value="#attributes.project_id#">
<input type="Hidden" name="project_code" value="#attributes.project_code#" >
<input type="Hidden" name="description" value="#attributes.description#">
<input type="Hidden" name="billable_type_id" value="#attributes.billable_type_id#">
<input type="Hidden" name="active_id" value="#attributes.active_id#">
<input type="Hidden" name="company_id" value="#attributes.company_id#">
<input type="Hidden" name="budget" value="#attributes.budget#">
<input type="Hidden" name="start_date" value="#attributes.start_date#">
<input type="Hidden" name="end_date" value="#attributes.end_date#">
<input type="Hidden" name="months" value="#attributes.months#">
<input type="Hidden" name="company_id" value="#attributes.company_id#">
<input type="Hidden" name="field_title" value="#attributes.field_title#">
<input type="Hidden" name="new_code" value="#attributes.project_id#">
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
  


