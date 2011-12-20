
<!--Reports/pag_manager_cross_tab.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am a cross tab report that dynamically generates the codes that the subordinates have hours in then displays the hours that each employee has for that code.  It then totals the person's hours and totals the hours spent on each code and gives a grand total.  For a specific date range.  I also offer a form at the bottom of the page of a successfully run report that gives the manager a chance to "verify" his subordinates hours.  The verification signals an email to be sent to John Burns.

	||
	Edits:
	$Log$
	||
	Variables:
	- ->from_date: this is the beginning of the date range of the report.
	- ->Through_date: this is the end of the date range of the report.
	END FUSEDOC --->
<cfset variables.all_option=0>
<cfset request.sup_id=session.user_account_id>
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfset variables.object_id=19>
<cfinclude template="qry_get_supervisor_info.cfm">
<cfset variables.all_option=get_supervisor_info.all_option>
<cfinclude template="qry_manager_crosstab_codes.cfm">
<cfif manager_crosstab_codes.recordcount>
<cfset variables.columns=manager_crosstab_codes.recordcount+3>
<cfinclude template="qry_manager_crosstab_hours.cfm">
<table border="1" cellpadding="1" cellspacing="0" align="center" width="95%" bordercolordark="#e1e1e1">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="#variables.columns#" title_class="HeadText#session.workstream_text_size#White" section_color="008080" section_title="Manager's Cross Tab Report" gutter="false" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="#variables.columns#" title_class="SubHeadText#session.workstream_text_size#White" section_color="5F5F5F" section_title="From: #attributes.from_date# &nbsp;To: #attributes.through_date#" gutter="false" align="center">
	<cfinclude template="dsp_crosstab_col_headers.cfm">
	<cfinclude template="dsp_crosstab_rows.cfm">
	<cfinclude template="dsp_crosstab_total.cfm">
</table>
<table border="0" cellpadding="2" cellspacing="0" align="center" width="95%">
	<cfinclude template="dsp_crosstab_mail_form.cfm">
</table>
<cfelse>
	<cfinclude template="../common_files/dsp_no_records.cfm">
</cfif>