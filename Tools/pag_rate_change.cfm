
<!--Tools/pag_rate_change.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the customer rate insert page.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfinclude template="qry_new_rates.cfm">
</cfsilent>
<table align="center" cellpadding="3" cellspacing="0" border="0">
<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#" section_color="ffffff" section_title="Customer Rate Insert" colspan="2" gutter="false" align="center">
<cfinclude template="dsp_customer_rate_grid.cfm">
</table>

