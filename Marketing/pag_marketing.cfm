<!--Marketing/pag_marketing.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	Variables:
	+++template="qry_get_marketing_data.cfm"
	+++ template="dsp_marketing_form.cfm"
	+++ template="dsp_marketing_sort_form.cfm"
	END FUSEDOC --->
<cfinclude template="qry_get_marketing_data.cfm">
<cfinclude template="qry_get_contact_count.cfm">
</cfsilent>
		<cfmodule template="../common_files/act_drilldown_form.cfm" fuseaction="marketing_edit" Function_name="drill_down" Field_name="project_id">
		<table border="0" cellpadding="0" cellspacing="0" align="center">	
			<cfinclude template="dsp_marketing_report.cfm">
			<cfinclude template="dsp_marketing_sort_form.cfm">
		</table>