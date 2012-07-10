
<!--Reports/pag_gross_hours_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the form for the gross hours report input page

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfform action="index.cfm?fuseaction=Reports.gross_hours" method="POST">
<table align="center" border="0" cellpadding="4" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="Gross Hours Report" section_color="008080" align="left" colspan="3" gutter="0" title_class="HeadTextWhite"> 
	<cfinclude template="dsp_gross_hours_input.cfm">
</table>
</cfform>

