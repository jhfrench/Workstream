
<!--Marketing/pag_marketing_line.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the marketing column graph.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_marketing_line.cfm">
<table border="0" cellpadding="1" cellspacing="0" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="0000ff" section_title="Nucleus Funnel" colspan="1" gutter="false" align="center">
	<cfinclude template="dsp_marketing_line.cfm">
</table>
			