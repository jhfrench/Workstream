
<!--Reports/pag_gross_hours_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the form for the gross hours report input page

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:11:11  stetzer
	<>

	Revision 1.2  2001-12-02 17:58:14-05  french
	Formatting changes.

	Revision 1.1  2001-10-11 11:04:15-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
</cfsilent>
<cfform action="index.cfm?fuseaction=Reports.gross_hours" method="POST">
<table align="center" border="0" cellpadding="4" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="Gross Hours Report" section_color="008080" align="left" colspan="3" gutter="0" title_class="HeadText#session.workstream_text_size#White"> 
	<cfinclude template="dsp_gross_hours_input.cfm">
</table>
</cfform>

