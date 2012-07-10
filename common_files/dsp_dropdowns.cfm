
<!--common_files/dsp_dropdowns.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the drop-down selection boxes for the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> attributes.fuseaction: string containing view that user has selected
	--> [attributes.view]: string containing label of desired task list view
	--> [attributes.emp_id]: number that indicates user to workstream
	<-- attributes.view: string containing label of desired task list view
	--> session.last_name: last name of the current user
	--> session.workstream_show_closed: number that indicates the desire of the user to hide or show tasks which have already been completed; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_on_hold: number that indicates the desire of the user to hide or show tasks which have been put on hold; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_team: number that indicates the desire of the user to hide or show tasks for which they are a member of the task team; 1 means include the task, 0 means exclude the task
 --->
<cfif isdefined("attributes.emp_id") AND compare(attributes.emp_id,session.user_account_id)AND NOT isdefined("attributes.inbox_owner")>
	<cfinclude template="../common_files/qry_get_employee_name.cfm">
	<cfset request.first_name=get_employee_name.first_name>
	<cfset request.last_name=get_employee_name.last_name>
<cfelseif isdefined("attributes.emp_id") AND compare(attributes.emp_id,session.user_account_id) AND isdefined("attributes.inbox_owner")>
	<cfset request.first_name=task_list.task_owner>
	<cfset request.last_name="">
<cfelse>
	<cfset attributes.emp_id=session.user_account_id>
	<cfset request.first_name=session.first_name>
	<cfset request.last_name=session.last_name>
</cfif>
<cfif NOT comparenocase(listlast(attributes.fuseaction, '.'),"engagement_list")>
	<cfset colspan1=3>
	<cfset colspan2=2>
	<cfset variables.total_columns=5>
<cfelse>
	<cfset colspan1=4>
	<cfset colspan2=4>
	<cfif listfind("1,5", session.workstream_emp_contact_type) OR session.workstream_show_hours_data_ind EQ 1><!--- show time data to employees or customers if their company is set up to view hours--->
		<cfset variables.total_columns=8>
	<cfelse>
		<cfset variables.total_columns=7>
	</cfif>
</cfif>
</cfsilent>
<cfform name="input_form" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
<cfoutput>
<input type="hidden" name="evaluate_task_options" value="1">
<cfif session.workstream_show_options><input type="hidden" name="show_options" value="#session.workstream_show_options#"></cfif>
<cfif NOT comparenocase(listlast(attributes.fuseaction, '.'),"engagement_list")>Case<cfelse>Task</cfif> Inbox for <cfmodule template="../common_files/dsp_team_select.cfm" emp_id="#attributes.emp_id#" show_team="1" onchange="form.submit();" fuseaction="#attributes.fuseaction#">
<cfif session.workstream_show_options>
	<cfif NOT comparenocase(listlast(attributes.fuseaction, '.'),"engagement_list")>&nbsp;&nbsp;<label for="show_closed_engagements" class="checkbox"><input type="checkbox" name="show_closed_engagements" id="show_closed_engagements" onclick="javascript:form.submit();"<cfif isdefined("session.workstream_show_closed_engagements") AND session.workstream_show_closed_engagements> checked</cfif>>Show Completed Projects</label></cfif>
	<label for="show_on_hold" class="checkbox"><input type="checkbox" name="show_on_hold" id="show_on_hold" onclick="javascript:form.submit();"<cfif isdefined("session.workstream_show_on_hold") AND session.workstream_show_on_hold> checked</cfif>>Show Tasks On Hold</label>
	<label for="show_closed" class="checkbox"><input type="checkbox" name="show_closed" id="show_closed" onclick="javascript:form.submit();"<cfif isdefined("session.workstream_show_closed") AND session.workstream_show_closed> checked</cfif>>Show Completed Tasks</label>
	<label for="show_team" class="checkbox"><input type="checkbox" name="show_team" id="show_team" onclick="javascript:form.submit();"<cfif isdefined("session.workstream_show_team") AND session.workstream_show_team> checked</cfif>>Show Team's Tasks</label>
</cfif>
</cfoutput>
</cfform>