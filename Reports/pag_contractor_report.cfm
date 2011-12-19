
<!--Reports/pag_contractor_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the indepedent contractor report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:10:38  stetzer
<>

Revision 1.1  2001-10-11 11:04:18-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_contractor_rep.cfm"> 
<table border="0" cellpadding="4" cellspacing="0" align="center" width="95%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008080" section_title="Contractor's Report" colspan="5" gutter="0" align="left">
	<cfinclude template="dsp_contractor_row_head.cfm">
	<cfinclude template="dsp_contractor_rows.cfm">
</table>	

