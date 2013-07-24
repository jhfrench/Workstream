
<!--Reports/pag_pto_report_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the PTO roport input page.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfparam name="session.workstream_pto_accrual_type_id" default="2">
<cfif session.workstream_pto_accrual_type_id EQ 1>
	<cfset variables.action="pto">
<cfelse>
	<cfset variables.action="pto_accrual_input">
</cfif>
</cfsilent>
<cfinclude template="act_pto_name_select.cfm">
<cfform name="pto_report_input" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="form-horizontal">
<fieldset>
	<legend>Personal Time Off Report</legend>
	<cfinclude template="dsp_pto_report_input.cfm">
</fieldset>
</cfform>