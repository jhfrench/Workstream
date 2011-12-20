
<!--Reports/pag_efficiency_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the efficiency report for the engagement that corresponds to what the user requests (as determined by the fuseaction).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.admin_month" default="#month(now())#">
<cfparam name="attributes.admin_year" default="#year(now())#">
<cfinclude template="act_efficiency_report.cfm">
</cfsilent>
<cfinclude template="act_change_month.cfm">
<cfoutput>
<form name="drill_down" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table align="center" border="0" cellpadding="2" cellspacing="0" width="98%">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="008080" section_title="Percent of #variables.project_name# Time" title_class="HeadTextWhite">
	<cfinclude template="dsp_efficiciency_header.cfm">
<cfif get_hier_2_id.hier_2_id NEQ 0 AND get_hier_2_id.hier_2_id LT 4>
	<cfinclude template="dsp_efficiency_report.cfm">
<cfelse>
	<cfif get_subordinates.recordcount>
		<cfinclude template="dsp_efficiency_report.cfm">
	<cfelse>
		<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="ffffff" section_title="Your search returned no records." title_class="Note">
	</cfif>
</cfif>
</cfoutput>
</table>
</form>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="Directory.employee_details">

