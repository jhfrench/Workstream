
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
	<cfset variables.table_width="70">
	<cfinclude template="qry_get_locations.cfm">
	<cfinclude template="qry_get_phone_types.cfm">
	<cfinclude template="qry_get_email_types.cfm">
	<cfinclude template="act_param_emp_edit_form_vars.cfm">
	<cfinclude template="qry_get_open_positions.cfm">
	<cfinclude template="qry_get_employee_type.cfm">
	<cfinclude template="qry_get_employee_classification.cfm">
	<cfinclude template="qry_get_user_type.cfm">
	<cfinclude template="qry_populate_employee_form.cfm">

	<cfinclude template="../common_files/qry_get_states.cfm">
	<cfinclude template="../common_files/qry_get_teams.cfm">
	<cfinclude template="act_param_emp_edit_form_vars.cfm">
</cfsilent>
<cfform action="index.cfm?fuseaction=Directory.emp_update" name="emp_edit" method="POST">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="<cfoutput>#variables.table_width#</cfoutput>%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;User Edit" section_color="970000" colspan="8" gutter=0 title_class="HeadTextWhite">
	<cfoutput query="populate_employee_form">
	<cfinclude template="dsp_emp_details_form.cfm">
	</cfoutput>
 <!--- --->
</table>
</cfform>
