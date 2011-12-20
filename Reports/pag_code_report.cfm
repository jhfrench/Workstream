
<!--Reports/pag_code_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the code report fuses.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset variables.month_loop=1>
<cfset variables.total_hours=0>
<cfset variables.grand_total_hours=0>
<cfset variables.emp_type_hours=0>
<cfset variables.query="code_report">
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfset variables.eval_month=month(variables.from_date)>
<cfloop from="#variables.from_date#" to="#variables.through_date#" step="1" index="ii">
<cfif month(ii) NEQ variables.eval_month>
	<cfset variables.month_loop=variables.month_loop+1>
	<cfset variables.eval_month=month(ii)>
</cfif>
</cfloop>
<cfset variables.column_count=variables.month_loop+4>
<cfinclude template="qry_code_report_get_code.cfm">
<cfinclude template="qry_code_report.cfm">
<table border="1" cellpadding="0" cellspacing="0" align="center" bordercolordark="#e1e1e1">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008080" section_title="Monthly Hours Report for #get_code.display#" colspan="#variables.column_count#" gutter="0" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm"  title_class="SubHeadTextWhite" section_color="5F5F5F" section_title="From: #attributes.from_date# &nbsp;To: #attributes.through_date#" colspan="#variables.column_count#" gutter="0" align="center">
	<cfset variables.column_count=variables.column_count-1>
	<cfinclude template="dsp_code_reports.cfm">
</table>
