
<!--Reports/pag_overtime_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the overtime report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:07  stetzer
	<>

	||
	END FUSEDOC --->
<cfset variables.overtime_ind=1>
</cfsilent>
<cfmodule template="../common_files/act_set_all_option.cfm" object_id="12">
<table border="0" cellpadding="1" cellspacing="0" align="center" width="60%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="3" title_class="HeadText#session.workstream_text_size#White" section_color="008080" section_title="Overtime Report" gutter="false" align="center">
	<cfinclude template="dsp_over_under_date_select.cfm">
	<cfinclude template="qry_get_under_over_hours.cfm">
	<cfinclude template="dsp_overtime_row_head.cfm">
</table>
