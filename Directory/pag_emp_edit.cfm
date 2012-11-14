
<!-- Directory/pag_emp_edit.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
	<cfinclude template="qry_get_locations.cfm">
	<cfinclude template="qry_get_phone_types.cfm">
	<cfinclude template="qry_get_email_types.cfm">
	<cfinclude template="act_param_emp_edit_form_vars.cfm">
	<cfinclude template="qry_get_open_positions.cfm">
	<cfinclude template="qry_get_employee_type.cfm">
	<cfinclude template="qry_get_employee_classification.cfm">
	<cfinclude template="../qry_get_ref_account_type.cfm">
	<cfinclude template="qry_populate_employee_form.cfm">

	<cfinclude template="../common_files/qry_get_states.cfm">
	<cfinclude template="../common_files/qry_get_teams.cfm">
	<cfinclude template="act_param_emp_edit_form_vars.cfm">
</cfsilent>
<cfform action="index.cfm?fuseaction=Directory.emp_update" name="emp_entry" method="POST" class="form-horizontal">
	<fieldset>
		<legend><h2>Edit Employee Details</h2></legend>
		<cfinclude template="dsp_employee_details_form.cfm">
	</fieldset>
</cfform>
