
<!--Marketing/pag_marketing_grid.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the marketing grid for the home of the marketing module.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_marketing_data.cfm">
<table align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText" section_color="ffffff" section_title="Grid" colspan="1" gutter="false" align="center">
	<cfinclude template="dsp_marketing_form.cfm">
</table>
