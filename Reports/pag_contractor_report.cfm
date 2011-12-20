
<!--Reports/pag_contractor_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the indepedent contractor report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_contractor_rep.cfm"> 
<table border="0" cellpadding="4" cellspacing="0" align="center" width="95%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008080" section_title="Contractor's Report" colspan="5" gutter="0" align="left">
	<cfinclude template="dsp_contractor_row_head.cfm">
	<cfinclude template="dsp_contractor_rows.cfm">
</table>	

