
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
<cfparam name="attributes.through_date" default="#month(now())#/#daysinmonth(now())#/#year(now())#"><!--- $issue$: change through_date to through_date to be consistent with other reports --->
<cfparam name="attributes.show_budgeted_ind" default="0">
<cfparam name="attributes.show_completed" default="0">

<cfmodule template="../common_files/qry_get_demographics.cfm" user_account_id="#attributes.user_account_id#">
</cfsilent>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">

<cfinclude template="qry_get_employee_force.cfm">
<cfinclude template="dsp_employee_force_chart.cfm">

<cfinclude template="qry_get_employee_force_totals.cfm">
<cfinclude template="qry_team_force_totals.cfm">
<div class="row-fluid">
	<div class="span6">
		<cfinclude template="dsp_employee_force_totals.cfm">
	</div>
	<div class="span6">
		Horizontal bar graph goes here
	</div>
</div>

<cfoutput>
<form name="form_employee_force" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
<fieldset>
	<legend>Criteria</legend>
	<label for="from_date">Start</label>
	<input type="date" name="from_date" id="from_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(now()+30, 'yyyy-mm-dd')#" value="#dateformat(attributes.from_date, 'yyyy-mm-dd')#" maxlength="10" class="span2 date" />
	<label for="through_date">End</label>
	<input type="date" name="through_date" id="through_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(now()+30, 'yyyy-mm-dd')#" value="#dateformat(attributes.through_date, 'yyyy-mm-dd')#" maxlength="10" class="span2 date" />
	<label for="show_completed"><input type="checkbox" name="show_completed" id="show_completed" value="1"<cfif attributes.show_completed> checked="checked"</cfif> /> Show only completed tasks</label>
	<label for="show_budgeted_ind"><input type="checkbox" name="show_budgeted_ind" id="show_budgeted_ind" value="1"<cfif attributes.show_budgeted_ind> checked="checked"</cfif> /> Show only budgeted tasks</label>
	<input type="hidden" name="user_account_id" value="#attributes.user_account_id#" />
	<input type="submit" name="submit" value="Update Report" class="btn btn-primary" />
</fieldset>
</form>
</cfoutput>