<!--Marketing/pag_marketing.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:09  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:47-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
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