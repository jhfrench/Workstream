
<!--Reports/pag_account_status_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:10:24  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_account_status_report.cfm">
<table align="center" cellpadding="2" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="10" gutter="0" section_color="008080" section_title="Account Task Matrix" title_class="HeadText#session.workstream_text_size#White">
	<cfinclude template="dsp_account_status_row_header.cfm">
	<cfinclude template="dsp_account_status_rows.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_jump" directory_action="../Timekeeping/" fuseaction="task_details" field_name="task_id">

