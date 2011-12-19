
<!--Reports/pag_gross_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code for the Gross hours report.  I create a report that displays all the hours that the employees have worked in this month.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:11:08  stetzer
	<>

	Revision 1.2  2001-12-02 17:58:14-05  french
	Formatting changes.

	Revision 1.1  2001-10-11 11:04:16-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfparam name="statement" default="0">
<cfset variables.report_date=CreateODBCDate('#month#/1/#year#')>
<cfset variables.daysinmonth=DaysInMonth(variables.report_date)>
</cfsilent>
<cfif variables.report_date LTE now()> 
<cfinclude template="qry_gross_hours.cfm">
<cfinclude template="../common_files/qry_office_select.cfm">
<cfinclude template="../common_files/qry_team_select.cfm">
<cfset variables.daysinmonth=variables.daysinmonth+3>
<table cellpadding="3" cellspacing="0" border="0"bordercolor="##000000">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="Gross Hours Report for #MonthAsString(attributes.month)#, #attributes.year#" section_color="008080" align="left" colspan="#variables.daysinmonth#" gutter="0" title_class="HeadText#session.workstream_text_size#White">
<cfset variables.daysinmonth=variables.daysinmonth-1>
	<cfinclude template="dsp_form_name_office.cfm">
<cfset variables.daysinmonth=DaysInMonth(variables.report_date)>
	<cfinclude template="dsp_gross_hours_row_header.cfm">
	<cfinclude template="dsp_gross_hours_rows.cfm">
</table>
<cfelse>
	<cfinclude template="error1.cfm">
</cfif>