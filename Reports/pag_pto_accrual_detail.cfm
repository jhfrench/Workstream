
<!--Reports/pag_pto_accrual_detail.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the page that tells employees how much Paid time off they have used and how much they have earned 

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="variables.individual" default="yes">
<cfif NOT comparenocase(variables.individual, "No")>
	<cfset attributes.emp_id=session.user_account_id>
<cfelseif NOT comparenocase(variables.individual, "Yes")>
	<cfset attributes.emp_id=attributes.pin>
</cfif>
<cfset variables.remain=0>
<cfset variables.total_in=0>
<cfset variables.total_out=0>
<cfset variables.condition=136-(month(now())*8)>
<cfset variables.report_title="">
<cfset variables.result=0>
<cfset variables.year_sum=0>
</cfsilent>
<cfif isdefined("attributes.adjustment_flag")>
	<cfinclude template="qry_insert_pto_grant.cfm">
</cfif>
<cf_htmlhead><cfinclude template="open_menu.js"></cf_htmlhead>
<cfinclude template="../common_files/qry_get_employee_name.cfm">
<cfinclude template="qry_get_pto_start.cfm">
<cfinclude template="qry_get_pto_year_summary.cfm">
<cfinclude template="qry_get_pto_detail.cfm">
<cfinclude template="qry_get_footer_file.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_edit" field_name="time_entry_id" field_value="0" fuseaction="Timekeeping.time_entry_edit" given_referer="Timekeeping.task_list">
<table border="0" cellspacing="0" width="50%" bordercolorlight="gray" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="6" gutter="0" section_color="008080" section_title="&nbsp;Personal Time Off used by #get_employee_name.first_name# #get_employee_name.last_name#" title_class="HeadTextWhite">
	<cfinclude template="dsp_pto_accrual_detail_header.cfm">
	<cfinclude template="dsp_pto_rows.cfm">
</table>
<cfif NOT comparenocase("french",CGI.auth_user)>
	<!--- Used whenever Judy V asks that I make manual adjustment to PTO accrual --->
	<cfinclude template="dsp_pto_adjustment_form.cfm">
</cfif>
<cfinclude template="#get_pto_footer_file.pto_footer_file#">
