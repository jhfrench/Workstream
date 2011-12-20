
<!--Reports/pag_gross_hours_ytd.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code for the Gross hours YTD report.  I create a report that displays all the hours that the employees have worked YTD.
	||
	Name: Joshua Peters
	||
	Variables:
	from_date,to_date,display_person,display_office,sort_by
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<table cellpadding="3" cellspacing="0" border="0"bordercolor="##000000" align="center" width="100%">
<cfmodule template="../common_files/dsp_section_title.cfm" section_title="Gross Hours Report - Breakdown" colspan="1" title_class="HeadText"  section_color="ffffff" align="center" gutter="false"> 
<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText" section_color="ffffff" section_title="From: #from_date# To: #to_date#"  gutter="false" align="center" colspan="1">
</table>

<table cellpadding="3" cellspacing="0" border="0"bordercolor="##000000" align="center" width="100%">
<cfinclude template="qry_get_ytd_gross_hours.cfm">
<cfinclude template="dsp_gross_hours_row_header_ytd.cfm">
<cfinclude template="dsp_gross_hours_rows_ytd.cfm">
</table>