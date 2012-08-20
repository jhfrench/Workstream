
<!-- Reports/pag_lost_time.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
</cfsilent>
<table cellpadding="3" cellspacing="0" border="0"bordercolor="##000000" align="center" width="100%">
<cfmodule template="../common_files/dsp_section_title.cfm" section_title="Lost Time Report" colspan="1" title_class="HeadText" section_color="ffffff" align="center" gutter="false"> 
<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText" section_color="ffffff" section_title="From: #from_date# To: #to_date#" gutter="false" align="center" colspan="1">
</table>

<cfinclude template="qry_lost_time2.cfm">
<table cellpadding="3" cellspacing="0" border="0"bordercolor="##000000" align="center" width="100%">
<cfinclude template="dsp_lost_time_row_headers.cfm">
<cfinclude template="dsp_lost_time_rows.cfm">
</table>


