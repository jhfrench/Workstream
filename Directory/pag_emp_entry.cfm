
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
<cfif isdefined("attributes.last_name")>
	<cfinclude template="act_enter_employee.cfm">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_employee" field_name="user_account_id" fuseaction="Administration.edit_account">
	<cfinclude template="dsp_emp_entered_message.cfm">
<cfelse>
	<cfinclude template="qry_get_employee_type.cfm">
	<cfinclude template="qry_get_employee_classification.cfm">
	<cfinclude template="../common_files/qry_get_ref_account_type.cfm">
	<cfinclude template="../common_files/qry_get_states.cfm">
	<cfinclude template="../common_files/qry_get_teams.cfm">
	<cfform action="index.cfm?fuseaction=#attributes.fuseaction#" name="emp_entry" method="POST" class="form-horizontal">
		<fieldset>
			<legend><h2>New Employee Onboarding</h2></legend>
			<cfinclude template="dsp_employee_details_form.cfm">
		</fieldset>
	</cfform>
</cfif>