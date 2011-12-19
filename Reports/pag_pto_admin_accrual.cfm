	
<!--Reports/pag_pto_admin_accrual.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:16  stetzer
	<>

	Revision 1.2  2001-10-16 09:29:50-04  french
	Tightened code. Corrected badly-mapped call to a module in common_files. Is this template even used anymore?

	Revision 1.1  2001-10-11 11:04:07-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfparam name="earned" default="0">
<cfparam name="used" default="0">
<cfparam name="remain" default="0">
<cfparam name="individual" default="0">
</cfsilent>
<cfinclude template="qry_nucleus_pto.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="pto" fuseaction ="pto_detail" field_name="pin" >
<cfinclude template="dsp_pto_header.cfm"> 
<table border="1" cellspacing="0" cellpadding="4" width="95%"  align="center">
	<cfinclude template="dsp_admin_pto_row_head.cfm">
	<cfinclude template="dsp_admin_pto_rows.cfm">
</table>
	 