
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
Revision 1.1  2006/01/19 18:59:06  stetzer
<>

Revision 1.0  2005-02-15 15:46:48-05  daugherty
Initial revision

Revision 1.2  2002-03-08 16:23:54-05  long
added code to let allow the drill down to the edit employee screen.

Revision 1.1  2001-10-11 10:56:08-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	||
	END FUSEDOC --->
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
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="#attributes.section_title#" section_color="970000" colspan="8" gutter=0 title_class="HeadText#session.workstream_text_size#White">
	<cfinclude template="dsp_emp_details.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="employee_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_employee" field_name="emp_id" fuseaction="emp_edit">
