
<!--Tools/pag_forceplanner.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfparam name="attributes.force_month" default="#month(now())#">
<cfparam name="attributes.force_year" default="#year(now())#">
<cfset variables.show_submit_button=1>
</cfsilent>
<cfif isdefined("attributes.sum_assigned")>
	<cfinclude template="act_forceplanner_save.cfm">
</cfif>
<cfinclude template="act_forceplanner_queries.cfm">
<cfinclude template="act_forceplanner.cfm">
<cfoutput>
<h1>#session.workstream_company_name# ForcePlanner</h1>
<form name="form_forceplanner" id="form_forceplanner" action="index.cfm?fuseaction=Tools.forceplanner_save" method="POST">
	<cfinclude template="dsp_forceplanner_tasks.cfm">
	<cfinclude template="dsp_forceplanner_summary.cfm">
	<cfif variables.show_submit_button>
		<input type="hidden" name="force_month" value="#attributes.force_month#" />
		<input type="hidden" name="force_year" value="#attributes.force_year#" />
		<input type="hidden" name="list_prospective_task_id" value="#variables.list_prospective_task_id#" />
		<input type="hidden" name="sum_assigned" id="sum_assigned" value="0" />
		<input type="submit" name="submit_button" value="Assign Tasks" onkeypress="document.forceplanner.submit();" onclick="document.forceplanner.submit();" class="btn btn-danger<cfif attributes.date_linked LT now()> disabled" disabled="disabled</cfif>" />
		<input type="reset" name="reset" value="Reload Form" class="btn<cfif attributes.date_linked LT now()> disabled" disabled="disabled</cfif>" />
	</cfif>
</form>
</cfoutput>

<cfinclude template="dsp_forceplanner_title_bar.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details" target="task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_project" field_name="project_id" fuseaction="Customers.edit_project" target="edit_project">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="user_account_id" fuseaction="Directory.employee_details" target="employee_details">