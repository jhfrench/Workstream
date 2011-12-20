
<!--Marketing/pag_marketing_home_drill.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the marketing home.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
	<cfinclude template="qry_get_marketing_home_drill.cfm">
<table border="0" cellpadding="1" cellspacing="0" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="0000ff" section_title="Sales &amp; Marketing Home" colspan="3" gutter="0" align="center">
	<cfinclude template="dsp_marketing_home_drill.cfm">
</table>
			