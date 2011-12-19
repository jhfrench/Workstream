
<!--Customers/pag_marketing_home_drill.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the marketing home.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:51:11  daugherty
	Initial revision

	Revision 1.2  2001-11-30 11:59:07-05  french
	Fixing report access error and de-stetzering..

	Revision 1.1  2001-10-11 10:55:46-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
	<cfinclude template="qry_get_marketing_home_drill.cfm">
<table border="0" cellpadding="1" cellspacing="0" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="0000ff" section_title="Sales &amp; Marketing Home" colspan="3" gutter="0" align="center">
	<cfinclude template="dsp_marketing_home_drill.cfm">
</table>
			