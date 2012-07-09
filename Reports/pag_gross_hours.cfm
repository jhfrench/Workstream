
<!--Reports/pag_gross_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code for the Gross hours report.  I create a report that displays all the hours that the employees have worked in this month.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="statement" default="0">
<cfset variables.report_date=CreateODBCDate("#attributes.month#/1/#attributes.year#")>
<cfset variables.daysinmonth=DaysInMonth(variables.report_date)>
</cfsilent>
<cfif variables.report_date LTE now()> 
<cfinclude template="qry_gross_hours.cfm">
<cfinclude template="../common_files/qry_office_select.cfm">
<cfinclude template="../common_files/qry_team_select.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%" class="table_striped">
	<thead>
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="Gross Hours Report for #MonthAsString(attributes.month)#, #attributes.year#" section_color="008080" align="left" colspan="#variables.daysinmonth+3#" gutter="0" title_class="HeadTextWhite">
	<cfinclude template="dsp_form_name_office.cfm">
	<cfinclude template="dsp_gross_hours_row_header.cfm">
	</thead>
	<tbody>
	<cfinclude template="dsp_gross_hours_rows.cfm">
	</tbody>
</table>
</cfif>