
<!--Reports/pag_undertime_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the undertime report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset variables.overtime_ind=0>
</cfsilent>
<cfmodule template="../common_files/act_set_all_option.cfm" object_id="13">
<table border="0" cellpadding="1" cellspacing="0" align="center" width="60%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="3" title_class="HeadTextWhite" section_color="008080" section_title="Undertime Report" gutter="false" align="center">
	<cfinclude template="dsp_over_under_date_select.cfm">
	<cfinclude template="qry_get_under_over_hours.cfm">
	<cfinclude template="dsp_overtime_row_head.cfm">
</table>