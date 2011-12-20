
<!--Reports/pag_employee_force.cfm
	Author: Jeromy F  -->
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
<cfif isdefined("attributes.emp_id")>
	<cfset variables.emp_id=attributes.emp_id>
<cfelse>
	<cfset variables.emp_id=session.user_account_id>
</cfif>
<cfmodule template="../common_files/qry_employee_name.cfm" emp_id="#variables.emp_id#">
<cfparam name="attributes.from_date" default="#month(now())#/1/#year(now())#">
<cfparam name="attributes.to_date" default="#month(now())#/#DaysInMonth(now())#/#year(now())#">
</cfsilent>
<cfinclude template="../common_files/dsp_pop_calendar.cfm">
<cfmodule template="../common_files/act_calendar.cfm" form_name="date_range" field_name="from_date,to_date">
<cfinclude template="qry_employee_force.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="9" gutter="0" section_color="008080" section_title="&nbsp;ForcePlanner Report for #request.employee_name#" title_class="HeadTextWhite">
	<cfinclude template="dsp_employee_force_header.cfm">
	<cfinclude template="dsp_employee_force_row.cfm"><!--- 
	<cfinclude template="dsp_supervisor_force_row_header.cfm"> --->
</table>
<p></p>
<cfinclude template="qry_employee_force_totals.cfm">
<cfinclude template="qry_team_force_totals.cfm">
<table align="left" border="0" cellpadding="1" cellspacing="0" width="40%">
	<cfinclude template="dsp_employee_force_totals.cfm">
</table>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">

