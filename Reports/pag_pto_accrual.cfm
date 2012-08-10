
<!--Reports/pag_pto_accrual.cfm
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
<cfparam name="individual" default="Yes">
<cfparam name="attributes.emp_id" default="#session.user_account_id#">
</cfsilent>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="pto" fuseaction="Reports.pto_detail" field_name="pin">
<cfinclude template="qry_get_pto_summary.cfm">
<cfinclude template="dsp_pto_details_table.cfm">
