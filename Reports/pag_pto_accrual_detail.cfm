
<!--Reports/pag_pto_accrual_detail.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the page that tells employees how much Paid time off they have used and how much they have earned 

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="variables.individual" default="yes">
<cfset attributes.user_account_id=variables.user_identification>
<cfset variables.remain=0>
<cfset variables.total_in=0>
<cfset variables.total_out=0>
<cfset variables.condition=136-(month(now())*8)>
<cfset variables.report_title="">
<cfset variables.result=0>
<cfset variables.year_sum=0>
</cfsilent>
<cfif isdefined("attributes.adjustment_flag")>
	<cfinclude template="qry_insert_pto_grant.cfm">
</cfif>
<cfinclude template="../common_files/qry_get_demographics.cfm">
<cfinclude template="qry_get_pto_start.cfm">
<cfinclude template="qry_get_pto_detail.cfm">
<cfinclude template="qry_get_pto_year_summary.cfm">

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_edit" field_name="time_entry_id" field_value="0" fuseaction="Timekeeping.time_entry_edit" given_referer="Timekeeping.task_list">
<cfinclude template="dsp_pto_accrual_detail.cfm">

<cfif variables.user_identification EQ 1>
	<!--- Used whenever Jeromy needs to make a manual adjustment to PTO accrual --->
	<cfinclude template="dsp_pto_adjustment_form.cfm">
</cfif>