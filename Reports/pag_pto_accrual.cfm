
<!--Reports/pag_pto_accrual.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:12  stetzer
	<>

	Revision 1.3  2001-10-16 12:14:34-04  french
	Minor formatting changes for display or readability.

	Revision 1.2  2001-10-16 08:46:33-04  long
	made the report compliant with the other PTO hours report.
	
	Revision 1.1  2001-10-11 11:04:07-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfparam name="form_pin" default="">
<cfparam name="earned" default="0">
<cfparam name="used" default="0">
<cfparam name="remain" default="0">
<cfparam name="individual" default="Yes">
<cfparam name="attributes.form_pin" default="#session.user_account_id#">
<cfset variables.report_title="">
<cfif listcontains(form_pin,"all")>
	<cfset variables.report_title="Manager ">
</cfif> 
</cfsilent>
<cfinclude template="qry_get_pto_summary.cfm">
<table align="center" width="60%" cellpadding="2" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="9" gutter="0" section_color="008080" section_title="&nbsp;#variables.report_title#Personal Time Off Report" title_class="HeadText#session.workstream_text_size#White">
	<cfinclude template="dsp_admin_pto_row_head.cfm">
	<cfinclude template="dsp_admin_pto_rows.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="pto" fuseaction="pto_detail" field_name="pin">

