
<!--Reports/pag_pto_accrual.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
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
<table align="center" border="0" cellpadding="1" cellspacing="0" width="60%" class="table_striped">
	<thead>
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="9" gutter="0" section_color="008080" section_title="&nbsp;#variables.report_title#Personal Time Off Report" title_class="HeadTextWhite">
	<cfinclude template="dsp_admin_pto_row_head.cfm">
	</thead>
	<tbody>
	<cfinclude template="dsp_admin_pto_rows.cfm">
	</tbody>
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="pto" fuseaction="pto_detail" field_name="pin">

