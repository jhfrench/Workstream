
<!--Reports/pag_billable_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for all the fuses in the billable hours report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:10:31  stetzer
	<>

	Revision 1.2  2002-02-08 16:53:58-05  french
	Changing format to match other reports.

	Revision 1.1  2001-10-11 11:04:20-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008080" section_title="Billable Monthly Hours Report for #attributes.from_date#&nbsp;through&nbsp;#attributes.through_date#" colspan="6" gutter="false" align="center">
	<cfinclude template="dsp_code_reports.cfm">
</table>
