
<!--Reports/dsp_sick_bank_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the Sick Bank report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfform name="sick_bank" action="index.cfm?fuseaction=Reports.sick_bank" method="POST">
<table border="0" cellpadding="1" cellspacing="0" align="center" width="30%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" gutter="1" section_color="008080" section_title="&nbsp;Sick Bank Report" title_class="HeadText#session.workstream_text_size#White">
	<cfinclude template="dsp_pto_report_input.cfm">
</table>
</cfform>
