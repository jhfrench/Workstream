
<!--Directory/pag_employee_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main employee directory page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfif listlen(session.workstream_selected_company_id) GT 1>
	<cfset variables.title_column_span=8>
<cfelse>
	<cfset variables.title_column_span=7>
</cfif>
</cfsilent>
<cfinclude template="qry_get_employee_list.cfm">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Employee Directory" section_color="970000" colspan="#variables.title_column_span#" gutter=0 title_class="HeadText#session.workstream_text_size#White">
	<cfinclude template="dsp_employee_list_header.cfm">
	<cfinclude template="dsp_employee_list_row.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="Directory.employee_details">

