
<!--Reports/pag_pto_report_input.cfm
	Author: Jeromy F  -->
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
<cfform name="pto_report_input" action="index.cfm?fuseaction=Reports.#action#" method="POST">
<table border="0" cellpadding="1" cellspacing="0" align="center" width="30%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" gutter="1" section_color="008080" section_title="&nbsp;Personal Time Off Report" title_class="HeadTextWhite">
	<cfinclude template="dsp_pto_report_input.cfm">
</table>
</cfform>

