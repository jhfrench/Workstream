
<!--Reports/pag_anniv_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the anniversary report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:10:28  stetzer
<>

Revision 1.1  2001-10-11 11:04:21-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_anniv_report.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="60%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="6" gutter="0" section_color="008080" section_title="Anniversary Report" title_class="HeadText#session.workstream_text_size#White">
	<cfinclude template="dsp_anniv_row_head.cfm">
	<cfinclude template="dsp_anniv_rows.cfm">
</table>
