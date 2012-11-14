
<!--Reports/pag_employee_force.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the employee's ForcePlanner report. This report shows an employee's efficiency score, task details and otehr information that corresponds to user-specified criteria.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.user_account_id" default="#variables.user_identification#">
<cfparam name="attributes.from_date" default="#month(now())#/1/#year(now())#">
<cfparam name="attributes.to_date" default="#month(now())#/#daysinmonth(now())#/#year(now())#"><!--- $issue$: change to_date to through_date to be consistent with other reports --->
<cfparam name="attributes.show_budgeted" default="0">
<cfparam name="attributes.show_completed" default="0">

<cfmodule template="../common_files/qry_get_demographics.cfm" user_account_id="#attributes.user_account_id#">
</cfsilent>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">

<cfinclude template="qry_employee_force.cfm">
<cfoutput>
<form name="form_employee_force" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
	<label for="from_date">Start</label>
	<input type="date" name="from_date" id="from_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(now()+30, 'yyyy-mm-dd')#" value="#dateformat(attributes.from_date, 'yyyy-mm-dd')#" maxlength="10" class="span2 date" />
	<label for="to_date">End</label>
	<input type="date" name="to_date" id="to_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(now()+30, 'yyyy-mm-dd')#" value="#dateformat(attributes.to_date, 'yyyy-mm-dd')#" maxlength="10" class="span2 date" />
	<label for="show_completed"><input type="checkbox" name="show_completed" id="show_completed" value="1"<cfif attributes.show_completed> checked="checked"</cfif> /> Show only completed tasks</label>
	<label for="show_budgeted"><input type="checkbox" name="show_budgeted" id="show_budgeted" value="1"<cfif attributes.show_budgeted> checked="checked"</cfif> /> Show only budgeted tasks</label>
	<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
	<input type="submit" name="submit" value="Retrieve tasks" class="btn btn-primary" />
</form>
</cfoutput>
<cfinclude template="dsp_employee_force_chart.cfm">

<cfinclude template="qry_employee_force_totals.cfm">
<cfinclude template="qry_team_force_totals.cfm">
<cfinclude template="dsp_employee_force_totals.cfm">
