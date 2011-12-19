
<!--Reports/pag_employee_info_input.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the form for the HR report input page

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<table align="center" border="0" cellpadding="4" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="#request.pagetitle#" section_color="008080" align="left" colspan="4" gutter="0" title_class="HeadText#session.workstream_text_size#White"> 
	<cfinclude template="dsp_employee_info_report_input.cfm">
</table>
