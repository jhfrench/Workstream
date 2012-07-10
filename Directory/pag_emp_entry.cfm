
<!--Directory/pag_emp_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the employee details page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_locations.cfm">
<cfinclude template="qry_get_phone_types.cfm">
<cfinclude template="qry_get_email_types.cfm">
<cfinclude template="act_param_emp_edit_form_vars.cfm">
<cfinclude template="qry_get_open_positions.cfm">
<cfif isdefined("attributes.lname")>
	<cfset variables.table_width="40">
	<cfinclude template="act_enter_employee.cfm">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_employee" field_name="emp_id" fuseaction="Administration.edit_account">
<cfelse>
	<cfset variables.table_width="70">
	<cfinclude template="qry_get_employee_type.cfm">
	<cfinclude template="qry_get_employee_classification.cfm">
	<cfinclude template="qry_get_user_type.cfm">
	<cfinclude template="../common_files/qry_get_states.cfm">
	<cfinclude template="../common_files/qry_get_teams.cfm"><!--- 
	<cfinclude template="../common_files/dsp_pop_calendar.cfm"> --->
	<cfmodule template="../common_files/act_calendar.cfm" form_name="emp_entry" field_name="hire_date,dob">
</cfif>
<cfform action="index.cfm?fuseaction=#attributes.fuseaction#" name="emp_entry" method="POST">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="<cfoutput>#variables.table_width#</cfoutput>%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;User Entry" section_color="970000" colspan="8" gutter=0 title_class="HeadTextWhite">
<cfif NOT isdefined("attributes.lname")>
	<cfinclude template="dsp_emp_details_form.cfm">
<cfelse>
	<cfinclude template="dsp_emp_entered_message.cfm">
</cfif>
</table>
</cfform>

