
<!--Tools/pag_rate_change.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the customer rate insert page.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:01:49  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:14-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfinclude template="qry_new_rates.cfm">
</cfsilent>
<table align="center" cellpadding="3" cellspacing="0" border="0">
<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#" section_color="ffffff" section_title="Customer Rate Insert" colspan="2" gutter="false" align="center">
<cfinclude template="dsp_customer_rate_grid.cfm">
</table>

