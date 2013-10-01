
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
	--> [attributes.user_account_id]: number that indicates user to workstream
	<-- attributes.view: string containing label of desired task list view
	--> session.last_name: last name of the current user
	--> session.workstream_show_closed: number that indicates the desire of the user to hide or show tasks which have already been completed; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_on_hold: number that indicates the desire of the user to hide or show tasks which have been put on hold; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_team: number that indicates the desire of the user to hide or show tasks for which they are a member of the task team; 1 means include the task, 0 means exclude the task
 --->
<cfif isdefined("attributes.user_account_id") AND compare(attributes.user_account_id, variables.user_identification)>
	<cfif isdefined("attributes.inbox_owner")>
		<cfset request.first_name=get_task_list.task_owner>
		<cfset request.last_name="">
	<cfelse>
		<cfinclude template="qry_get_demographics.cfm">
		<cfset request.first_name=get_demographics.first_name>
		<cfset request.last_name=get_demographics.last_name>
	</cfif>
<cfelse>
	<cfset attributes.user_account_id=variables.user_identification>
	<cfset request.first_name=session.first_name>
	<cfset request.last_name=session.last_name>
</cfif>

<cfif NOT comparenocase(listlast(attributes.fuseaction, '.'),"project_list")>
	<cfset variables.total_columns=5>
<cfelse>
	<cfset variables.total_columns=8>
</cfif>
</cfsilent>
<cfform name="input_form" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	<input type="hidden" name="evaluate_task_options" value="1" />
	<cfif NOT comparenocase(listlast(attributes.fuseaction, '.'),"project_list")>Project<cfelse>Task</cfif> Inbox for <cfmodule template="dsp_team_select.cfm" user_account_id="#attributes.user_account_id#" show_team="1" onchange="form.submit();" fuseaction="#attributes.fuseaction#">
	<cfif NOT comparenocase(listlast(attributes.fuseaction, '.'),"project_list")>&nbsp;&nbsp;<label for="show_closed_project_ind" class="checkbox" title="Show completed projects"><input type="checkbox" name="show_closed_project_ind" id="show_closed_project_ind" onclick="javascript:form.submit();"<cfif isdefined("session.workstream_show_closed_project_ind") AND session.workstream_show_closed_project_ind> checked="checked"</cfif>>Completed projects</label></cfif>
	<label for="show_on_hold" class="checkbox" title="Show tasks on hold"><input type="checkbox" name="show_on_hold" id="show_on_hold" onclick="javascript:form.submit();"<cfif isdefined("session.workstream_show_on_hold") AND session.workstream_show_on_hold> checked="checked"</cfif>>Tasks on hold</label>
	<label for="show_closed" class="checkbox" title="Show completed tasks"><input type="checkbox" name="show_closed" id="show_closed" onclick="javascript:form.submit();"<cfif isdefined("session.workstream_show_closed") AND session.workstream_show_closed> checked="checked"</cfif>>Completed tasks</label>
	<label for="show_team" class="checkbox" title="Show team tasks"><input type="checkbox" name="show_team" id="show_team" onclick="javascript:form.submit();"<cfif isdefined("session.workstream_show_team") AND session.workstream_show_team> checked="checked"</cfif>>Team Tasks</label>
</cfform>