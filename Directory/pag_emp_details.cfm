
<!--Directory/pag_emp_details.cfm
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
<cfinclude template="qry_get_emp_position_number.cfm">
<cfinclude template="qry_get_emp_job_titles.cfm">
<cfinclude template="qry_get_emp_performance_review.cfm">
<cfinclude template="qry_get_emp_benefits_info.cfm">
<cfinclude template="qry_get_emp_salary_info.cfm">
<cfinclude template="qry_get_emp_details.cfm">
<cfinclude template="qry_get_emp_phone.cfm">
<cfinclude template="qry_get_emp_email.cfm">
<cfinclude template="qry_get_emp_companies.cfm">
<cfinclude template="qry_get_emp_location.cfm">
<cfinclude template="qry_get_subordinates.cfm">
<cfset attributes.section_title="&nbsp;#get_emp_details.lname#, #get_emp_details.fname#">
<cfif compare(get_emp_details.credentials,"")>
	<cfset attributes.section_title="#attributes.section_title#; #get_emp_details.credentials#">
</cfif>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="#attributes.section_title#" section_color="970000" colspan="8" gutter=0 title_class="HeadTextWhite">
	<cfinclude template="dsp_emp_details.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="Directory.employee_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_employee" field_name="emp_id" fuseaction="Directory.emp_edit">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="position_number_change" field_name="emp_id" fuseaction="Directory.position_number_change">
