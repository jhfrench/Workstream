
<!--Reports/pag_billable_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for all the fuses in the billable hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.month_loop=0>
<cfset variables.column_count=5>
<cfset variables.total_hours=0>
<cfset variables.grand_total_hours=0>
<cfset variables.emp_type_hours=0>
<cfset query="monthly_hours">
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfinclude template="qry_monthly_hours.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="70%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008080" section_title="Billable Monthly Hours Report for #attributes.from_date#&nbsp;through&nbsp;#attributes.through_date#" colspan="6" gutter="false" align="center">
	<cfinclude template="dsp_code_reports.cfm">
</table>
