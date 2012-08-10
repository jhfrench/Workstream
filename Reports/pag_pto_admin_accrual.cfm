
<!--Reports/pag_pto_admin_accrual.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
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
<cfinclude template="dsp_pto_details_table.cfm">